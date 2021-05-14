#include "todo_display.h"

#include "DEV_Config.h"
#include "EPD.h"
#include "GUI_Paint.h"
#include "eink.h"

// TODO: Pass in IP info
#include <WiFi.h>

TodoDisplay::TodoDisplay(TodoList &list) : TodoDisplay(&list) {}
TodoDisplay::TodoDisplay(TodoList *list) : todoList(list) {}

const int TASK_TOP_OFFSET = 50;
const int TASK_LINE_HEIGHT = 107;

void TodoDisplay::drawTasks() {
  printf("Draw tasks\n");
  for (int i = 0; i < todoList->numClientTasks; i += 1) {
    Paint_SelectImage(BlackImage);

    int y = i * TASK_LINE_HEIGHT + TASK_TOP_OFFSET;
    Task *task = todoList->taskList[i];
    if (task->isOverdue(todoList->lastTimestamp) == 0) {
      // digitalWrite(Led0, 1);
      Paint_SelectImage(RYImage);
    }

    printf("Draw at (%d, 10)\n", y);
    // Paint_DrawString_EN(0, y, "<", &Font24, BLACK, WHITE);
    Paint_DrawRectangle(30, y, 50, y + 20, BLACK, DOT_PIXEL_1X1,
                        DRAW_FILL_EMPTY);
    Paint_DrawString_EN(60, y, task->title.c_str(), &Font24, BLACK, WHITE);

    if (task->isDone == 1) {
      Paint_DrawLine(55, y + 12, Paint.Width - 5, y + 12, BLACK, DOT_PIXEL_1X1,
                     LINE_STYLE_SOLID);
      Paint_DrawString_EN(31, y, "x", &Font20, BLACK, WHITE);
    }
  }
}

void TodoDisplay::drawFrame() {
  printf("Draw frame\n");
  Paint_SelectImage(RYImage);
  Paint_Clear(WHITE);
  Paint_SelectImage(BlackImage);
  Paint_Clear(WHITE);

  // Paint_DrawLine(0, 30, Paint.Width, 30, BLACK, DOT_PIXEL_1X1,
  //                  LINE_STYLE_SOLID);
  Paint_DrawLine(0, 850, Paint.Width, 850, BLACK, DOT_PIXEL_1X1,
                 LINE_STYLE_SOLID);
  Paint_DrawString_EN(200, 865, WiFi.localIP().toString().c_str(), &Font12,
                      BLACK, WHITE);
}

void TodoDisplay::render() {
  drawFrame();
  drawTasks();

  printf("EPD_Display\r\n");
  EPD_7IN5B_HD_Display(BlackImage, RYImage);
}

void TodoDisplay::cleanup() {
  printf("Goto Sleep...\r\n");
  EPD_7IN5B_HD_Sleep();
  free(BlackImage);
  free(RYImage);
  BlackImage = NULL;
  RYImage = NULL;
}

void TodoDisplay::setup() {
  DEV_Module_Init();
  printf("EPD_7IN5B_HD_test Demo\r\n");
  printf("e-Paper Init and Clear...\r\n");
  EPD_7IN5B_HD_Init();
  EPD_7IN5B_HD_Clear();
  DEV_Delay_ms(500);
  printf("Set rotate\n");

  /* you have to edit the startup_stm32fxxx.s file and set a big enough heap
   * size */
  UWORD Imagesize =
      ((EPD_7IN5B_HD_WIDTH % 8 == 0) ? (EPD_7IN5B_HD_WIDTH / 8)
                                     : (EPD_7IN5B_HD_WIDTH / 8 + 1)) *
      EPD_7IN5B_HD_HEIGHT;
  if ((BlackImage = (UBYTE *)malloc(Imagesize)) == NULL) {
    printf("Failed to apply for black memory...\r\n");
    while (1)
      ;
  }
  if ((RYImage = (UBYTE *)malloc(Imagesize)) == NULL) {
    printf("Failed to apply for red memory...\r\n");
    while (1)
      ;
  }
  printf("NewImage:BlackImage and RYImage\r\n");
  Paint_NewImage(BlackImage, EPD_7IN5B_HD_WIDTH, EPD_7IN5B_HD_HEIGHT, ROTATE_90,
                 WHITE);
  Paint_NewImage(RYImage, EPD_7IN5B_HD_WIDTH, EPD_7IN5B_HD_HEIGHT, ROTATE_90,
                 WHITE);

  Paint_SelectImage(RYImage);
  Paint_Clear(WHITE);
  Paint_SelectImage(BlackImage);
  Paint_Clear(WHITE);
}
