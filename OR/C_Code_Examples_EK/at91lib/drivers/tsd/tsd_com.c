/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support
 * ----------------------------------------------------------------------------
 * Copyright (c) 2008, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */

//------------------------------------------------------------------------------
//         Headers
//------------------------------------------------------------------------------

#include "tsd.h"
#include <board.h>
#include <aic/aic.h>
#include <pio/pio.h>
#include <drivers/lcd/lcdd.h>
#include <drivers/lcd/draw.h>
#include <drivers/lcd/font.h>
#include <drivers/lcd/color.h>
#include <string.h>

//------------------------------------------------------------------------------
//         Local definitions
//------------------------------------------------------------------------------

/// Size in pixels of calibration points.
#define POINTS_SIZE         4
/// Maximum difference in pixels between the test point and the measured point.
#define POINTS_MAX_ERROR    8

/// Delay at the end of calibartion for result display (positive or negative)
#define DELAY_RESULT_DISPLAY 4000000

//------------------------------------------------------------------------------
//         Local types
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/// Point used during the touchscreen calibration process.
//------------------------------------------------------------------------------
typedef struct _CalibrationPoint {

    /// Coordinate of point along the X-axis of the screen.
    unsigned int x;
    /// Coordinate of point along the Y-axis of the screen.
    unsigned int y;
    /// Calibration data of point.
    unsigned int data[2];

} CalibrationPoint;

//------------------------------------------------------------------------------
//         Local variables
//------------------------------------------------------------------------------

/// indicates if the touch screen has been calibrated.
/// If not, Callback functions are not called
static volatile unsigned char bCalibrationOk = 0;
/// Slope for interpoling touchscreen measurements along the X-axis.
static signed int xSlope;
/// Slope for interpoling touchscreen measurements along the Y-axis.
static signed int ySlope;

/// Calibration points
static CalibrationPoint calibrationPoints[] = {

    // Top-left corner calibration point
    {
        BOARD_LCD_WIDTH / 10,
        BOARD_LCD_HEIGHT / 10,
        {0, 0}
    },
    // Top-right corner calibration point
    {
        BOARD_LCD_WIDTH - BOARD_LCD_WIDTH / 10,
        BOARD_LCD_HEIGHT / 10,
        {0, 0}
    },
    // Bottom-right corner calibration point
    {
        BOARD_LCD_WIDTH - BOARD_LCD_WIDTH / 10,
        BOARD_LCD_HEIGHT - BOARD_LCD_HEIGHT / 10,
        {0, 0}
    },
    // Bottom-left corner calibration point
    {
        BOARD_LCD_WIDTH / 10,
        BOARD_LCD_HEIGHT - BOARD_LCD_HEIGHT / 10,
        {0, 0}
    }
};

/// Test point
static const CalibrationPoint testPoint = {
    BOARD_LCD_WIDTH / 2,
    BOARD_LCD_HEIGHT / 2,
    {0, 0}
};

//------------------------------------------------------------------------------
//         External functions
//------------------------------------------------------------------------------

extern void TSD_GetRawMeasurement(unsigned int *pData);
extern void TSD_WaitPenPressed(void);
extern void TSD_WaitPenReleased(void);

//------------------------------------------------------------------------------
//         Local functions
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/// Display a calibration point on the given buffer.
/// \param pLcdBuffer  LCD buffer to draw on.
/// \param pPoint  Calibration point to display.
//------------------------------------------------------------------------------
static void DrawCalibrationPoint(
    void *pLcdBuffer,
    const CalibrationPoint *pPoint)
{
    LCDD_DrawRectangle(pLcdBuffer,
                       pPoint->x - POINTS_SIZE / 2,
                       pPoint->y - POINTS_SIZE / 2,
                       POINTS_SIZE,
                       POINTS_SIZE,
                       COLOR_RED);
}

//------------------------------------------------------------------------------
/// Clears a calibration point from the given buffer.
/// \param pLcdBuffer  LCD buffer to draw on.
/// \param pPoint  Calibration point to clear.
//------------------------------------------------------------------------------
static void ClearCalibrationPoint(
    void *pLcdBuffer,
    const CalibrationPoint *pPoint)
{
    LCDD_DrawRectangle(pLcdBuffer,
                       pPoint->x - POINTS_SIZE / 2,
                       pPoint->y - POINTS_SIZE / 2,
                       POINTS_SIZE,
                       POINTS_SIZE,
                       COLOR_WHITE);
}

//------------------------------------------------------------------------------
//         Global functions
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/// Indicates if the calibration of the touch screen is Ok
/// \return 1 calibration Ok, 0 if not
//------------------------------------------------------------------------------
unsigned char TSDCom_IsCalibrationOk(void)
{
    return bCalibrationOk;
}

//------------------------------------------------------------------------------
/// Interpolates the provided raw measurements using the previously calculated
/// slope. The resulting x and y coordinates are stored in an array.
/// \param pData  Raw measurement data, as returned by TSD_GetRawMeasurement().
/// \param pPoint  Array in which x and y will be stored.
//------------------------------------------------------------------------------
void TSDCom_InterpolateMeasurement(const unsigned int *pData, unsigned int *pPoint)
{
    pPoint[0] = calibrationPoints[0].x
                - (((signed int) calibrationPoints[0].data[0] - (signed int) pData[0]) * 1024)
                / xSlope;

    pPoint[1] = calibrationPoints[0].y
                - (((signed int) calibrationPoints[0].data[1] - (signed int) pData[1]) * 1024)
                / ySlope;

    if(pPoint[0] & 0x80000000) // Is pPoint[0] negative ?
    {
        pPoint[0] = 0;
    }

    if(pPoint[0] > BOARD_LCD_WIDTH) // Is pPoint[0] bigger than the LCD width ?
    {
        pPoint[0] = BOARD_LCD_WIDTH;
    }

    if(pPoint[1] & 0x80000000) // Is pPoint[1] negative ?
    {
        pPoint[1] = 0;
    }

    if(pPoint[1] > BOARD_LCD_HEIGHT) // Is pPoint[1] bigger than the LCD width ?
    {
        pPoint[1] = BOARD_LCD_HEIGHT;
    }
}

//------------------------------------------------------------------------------
/// Performs the calibration process using the provided buffer to display
/// information.
/// \param pLcdBuffer  LCD buffer to display.
/// \return True if calibration was successful; otherwise false.
//------------------------------------------------------------------------------
unsigned char TSDCom_Calibrate(void *pLcdBuffer)
{
    void *pOldLcdBuffer;
    volatile unsigned int i; // to keep the tempo with gcc code optimisation
    signed int slope1, slope2;
    CalibrationPoint measuredPoint;
    unsigned char xOk, yOk;
    signed int xDiff, yDiff;

    // Calibration setup
    LCDD_Fill(pLcdBuffer, COLOR_WHITE);
    LCDD_DrawString(pLcdBuffer, 30, 50, "LCD calibration", COLOR_BLACK);
    LCDD_DrawString(pLcdBuffer, 1, 100, " Touch the dots to\ncalibrate the screen", COLOR_DARKBLUE);
    pOldLcdBuffer = LCDD_DisplayBuffer(pLcdBuffer);

    // Calibration points
    for (i=0; i < 4; i++) {

        DrawCalibrationPoint(pLcdBuffer, &calibrationPoints[i]);

        // Wait for touch & end of conversion
        TSD_WaitPenPressed();
        TSD_GetRawMeasurement(calibrationPoints[i].data);
        ClearCalibrationPoint(pLcdBuffer, &calibrationPoints[i]);

        // Wait for contact loss
        TSD_WaitPenReleased();
    }

    // Calculate slopes using the calibration data
    // Theory behind those calculations:
    //   - We suppose the touchscreen measurements are linear, so the following equations are true (simple
    //     linear regression) for any two 'a' and 'b' points of the screen:
    //       dx = (a.data[0] - b.data[0]) / (a.x - b.x)
    //       dy = (a.data[1] - b.data[1]) / (a.y - b.y)
    //
    //   - We calculate dx and dy (called xslope and yslope here) using the calibration points.
    //
    //   - We can then use dx and dy to infer the position of a point 'p' given the measurements performed
    //     by the touchscreen ('c' is any of the calibration points):
    //       dx = (p.data[0] - c.data[0]) / (p.x - c.x)
    //       dy = (p.data[1] - c.data[1]) / (p.y - c.y)
    //     Thus:
    //       p.x = c.x - (p.data[0] - c.data[0]) / dx
    //       p.y = c.y - (p.data[1] - c.data[1]) / dy
    //
    //   - Since there are four calibration points, dx and dy can be calculated twice, so we average
    //     the two values.
    slope1 = ((signed int) calibrationPoints[0].data[0]) - ((signed int) calibrationPoints[1].data[0]);
    slope1 *= 1024;
    slope1 /= ((signed int) calibrationPoints[0].x) - ((signed int) calibrationPoints[1].x);
    slope2 = ((signed int) calibrationPoints[2].data[0]) - ((signed int) calibrationPoints[3].data[0]);
    slope2 *= 1024;
    slope2 /= ((signed int) calibrationPoints[2].x) - ((signed int) calibrationPoints[3].x);
    xSlope = (slope1 + slope2) / 2;

    slope1 = ((signed int) calibrationPoints[0].data[1]) - ((signed int) calibrationPoints[2].data[1]);
    slope1 *= 1024;
    slope1 /= ((signed int) calibrationPoints[0].y) - ((signed int) calibrationPoints[2].y);
    slope2 = ((signed int) calibrationPoints[1].data[1]) - ((signed int) calibrationPoints[3].data[1]);
    slope2 *= 1024;
    slope2 /= ((signed int) calibrationPoints[1].y) - ((signed int) calibrationPoints[3].y);
    ySlope = (slope1 + slope2) / 2;

    // Test point
    LCDD_Fill(pLcdBuffer, 0xFFFFFF);
    LCDD_DrawString(pLcdBuffer, 30, 50, "LCD calibration", COLOR_BLACK);
    LCDD_DrawString(pLcdBuffer, 1, 100, " Touch the point to\nvalidate calibration", COLOR_DARKBLUE);
    DrawCalibrationPoint(pLcdBuffer, &testPoint);

    // Wait for touch & end of conversion
    TSD_WaitPenPressed();

    TSD_GetRawMeasurement(measuredPoint.data);
    TSDCom_InterpolateMeasurement(measuredPoint.data, (unsigned int *) &measuredPoint);
    DrawCalibrationPoint(pLcdBuffer, &measuredPoint);

    // Check resulting x and y
    xDiff = (signed int) measuredPoint.x - (signed int) testPoint.x;
    yDiff = (signed int) measuredPoint.y - (signed int) testPoint.y;
    xOk = (xDiff >= -POINTS_MAX_ERROR) && (xDiff <= POINTS_MAX_ERROR);
    yOk = (yDiff >= -POINTS_MAX_ERROR) && (yDiff <= POINTS_MAX_ERROR);

    // Wait for contact loss
    TSD_WaitPenReleased();

    // Check calibration result
    if (xOk && yOk) {

        bCalibrationOk = 1;
        LCDD_Fill(pLcdBuffer, COLOR_WHITE);
        LCDD_DrawString(pLcdBuffer, 30, 50, "LCD calibration", COLOR_BLACK);
        LCDD_DrawString(pLcdBuffer, 80, 100, "Success !", COLOR_GREEN);

    }
    else {

        bCalibrationOk = 0;
        LCDD_Fill(pLcdBuffer, COLOR_WHITE);
        LCDD_DrawString(pLcdBuffer, 30, 50, "LCD calibration", COLOR_BLACK);
        LCDD_DrawString(pLcdBuffer, 40, 100, "Error too big", COLOR_RED);
    }

    // Slight delay
    for (i = 0; i < DELAY_RESULT_DISPLAY; i++);

    // Restore old LCD buffer
    LCDD_DisplayBuffer(pOldLcdBuffer);

    return (xOk && yOk);
}
