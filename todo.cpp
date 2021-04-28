#include <HttpClient.h>
#include <SSLClient.h>

//#define MBEDTLS_DEBUG_C 1

#include "Client.h"
#include "DEV_Config.h"
#include "EPD.h"
#include "GUI_Paint.h"
#include "mbedtls/debug.h"
#include <WiFi.h>
#include <stdlib.h>

#include "eink.h"
#include "todo.h"
//#include "trust_anchor.h"

// const char *ssid;
// const char *password;
// const char *taskURL;
#include "secrets.h"

// Create a new image cache
UBYTE *BlackImage, *RYImage;

WiFiClient base_client;
TodoList todo(taskURL);

int setupWifi() {
  if (WiFi.isConnected()) {
    printf("Wifi connected\n");
    return 0;
  }
  printf("Connecting to wifi %s\n", ssid);
  WiFi.setTxPower(WIFI_POWER_19_5dBm);
  WiFi.begin(ssid, password);
  WiFi.setAutoConnect(true);

  for (int attempt = 0; attempt < 50 && WiFi.status() != WL_CONNECTED;
       attempt++) {
    delay(500);
    printf(".");
    if (attempt % 10 == 0) {
      printf("\n");
    }
  }
  if (WiFi.status() != WL_CONNECTED) {
    printf("Failed to connect to wifi\n");
    // WiFi.disconnect(true);
    return -1;
  }

  printf("\nWiFi connected\nIP address: %s\n",
         WiFi.localIP().toString().c_str());
  return 0;
}

// TODO: Fetch temp / weather ?
// TODO: Look into adding lines across for style
// TODO: Checkmark for completed tasks
// TODO: Red color for overdue tasks
// TODO: Read buttons for done
// TODO: Flash LED on overdue
// TODO: Fix spacing and all that
// TODO: Speaker / sound
// TODO: Neopixels on top
// TODO: Korean word of the day?? (First todo?)

bool button0Pressed = false;
void IRAM_ATTR pushButton0Pressed() { button0Pressed = true; }

const int PushButton0 = 36;
const int Led0 = 32;
void setupButtons() {
  pinMode(PushButton0, INPUT);
  attachInterrupt(PushButton0, pushButton0Pressed, RISING);

  pinMode(Led0, OUTPUT);
  digitalWrite(Led0, 0);
}

int getTasks() {
  int err;
  int lastUpdateTimestamp = todo.lastTimestamp;

  for (int attempt = 0; attempt < 5; attempt++) {
    //    printf("Init SSL\n");
    printf("Init HTTP\n");
    HttpClient http(base_client);
    printf("Updating tasks\n");
    err = todo.updateTasks(&http);
    if (err != 0) {
      printf("Error updating tasks: %d\n", err);
    } else if (lastUpdateTimestamp == todo.lastTimestamp) {
      printf("Failed to get update\n");
    } else {
      printf("Update success\n");
      return 0;
    }
  }
  return -1;
}

void cleanupEInk() {
  printf("Goto Sleep...\r\n");
  EPD_7IN5B_HD_Sleep();
  free(BlackImage);
  free(RYImage);
  BlackImage = NULL;
  RYImage = NULL;
}

void setupEInk() {
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

void drawFrame() {
  Paint_SelectImage(RYImage);
  Paint_Clear(WHITE);
  Paint_SelectImage(BlackImage);
  Paint_Clear(WHITE);

  Paint_DrawLine(0, 30, Paint.Width, 30, BLACK, DOT_PIXEL_1X1,
                 LINE_STYLE_SOLID);
  Paint_DrawLine(0, 850, Paint.Width, 850, BLACK, DOT_PIXEL_1X1,
                 LINE_STYLE_SOLID);
  Paint_DrawString_EN(200, 865, WiFi.localIP().toString().c_str(), &Font12,
                      BLACK, WHITE);
}

void drawTasks() {
  // Select Image

  printf("Draw words\n");
  for (int i = 0; i < todo.numClientTasks; i += 1) {
    Paint_SelectImage(BlackImage);

    int y = i * 95 + 100;
    Task *task = todo.taskList[i];
    if (i == 0 && task->isDone == 0) {
      digitalWrite(Led0, 1);
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

// Paint_DrawNum(10, 50, 987654321, &Font16, WHITE, BLACK);

void setup() {
  setupButtons();

  int err = setupWifi();
  if (err < 0) {
    printf("Failed wifi :(");
  }
  setupEInk();

  // get time, tasks and other info

  // EPD_7IN5_HD_Clear();
  ///  DEV_Delay_ms(10000);

  // cleanupEInk();
}

void checkButtons() {
  if (button0Pressed) {
    printf("Button0 was pressed!\n");
    button0Pressed = false;
    HttpClient http(base_client);
    int err = http.get("http://192.168.2.84/done/0");
    if (err < 0) {
      printf("Failed to mark task done");
    }
    todo.taskList[0]->isDone = 1;
    drawFrame();
    drawTasks();

    printf("EPD_Display\r\n");
    EPD_7IN5B_HD_Display(BlackImage, RYImage);
  }
}

long lastGotTasks = 0;
/* The main loop -------------------------------------------------------------*/
void loop() {
  checkButtons();
  if (millis() - lastGotTasks > 60 * 1000) {
    printf("Get tasks!\n");
    int err = updateTasks();
    if (err == 0) {
      lastGotTasks = millis();
    } else {
      printf("Failed to update, sleeping 5s\n");
      delay(5000);
    }
  }
}

int updateTasks() {
  int err = setupWifi();
  if (err < 0) {
    printf("Wifi failed\n");
    delay(1000);
    return -1;
  }

  err = getTasks();
  if (err < 0) {
    printf("Failed to get tasks\n");
    return -1;
  }
  drawFrame();
  drawTasks();
  printf("EPD_Display\r\n");
  EPD_7IN5B_HD_Display(BlackImage, RYImage);
}
