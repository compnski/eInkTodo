#include <HttpClient.h>
#include <SSLClient.h>

#include "Client.h"
#include <WiFi.h>
#include <stdlib.h>

#include "todo.h"

#include "secrets.h"

//#include "mbedtls/debug.h"

// Create a new image cache

WiFiClient base_client;
TodoList todo(taskURL);
TodoDisplay display(todo, LedPins);

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


bool taskButton[MAX_DISPLAYED_TASKS];

void IRAM_ATTR pushButton0Pressed() { taskButton[0] = true; }
void IRAM_ATTR pushButton1Pressed() { taskButton[1] = true; }
void IRAM_ATTR pushButton2Pressed() { taskButton[2] = true; }
void IRAM_ATTR pushButton3Pressed() { taskButton[3] = true; }
void IRAM_ATTR pushButton4Pressed() { taskButton[4] = true; }
void IRAM_ATTR pushButton5Pressed() { taskButton[5] = true; }
void IRAM_ATTR pushButton6Pressed() { taskButton[6] = true; }
void IRAM_ATTR pushButton7Pressed() { taskButton[7] = true; }

typedef void (*FP)();
const FP PushButtonCbs[MAX_DISPLAYED_TASKS]= {&pushButton0Pressed,
  &pushButton1Pressed,
  &pushButton2Pressed,
  &pushButton3Pressed,
  &pushButton4Pressed,
  &pushButton5Pressed,
  &pushButton6Pressed,
  &pushButton7Pressed};

const int PushButtonPins[MAX_DISPLAYED_TASKS] = {36, 36, 36, 36, 36, 36, 36, 36};
const int LedPins[MAX_DISPLAYED_TASKS] = {32, 32, 32, 32, 32, 32, 32, 32};

void setupButtons() {
  for ( int i = 0; i < MAX_DISPLAYED_TASKS; i++ ){
    pinMode(PushButtonPins[i], INPUT);
    attachInterrupt(PushButtonPins[i], PushButtonCbs[i], RISING);

    pinMode(LedPins[i], OUTPUT);
    digitalWrite(LedPins[i], 0);
  }
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

void setup() {
  setupButtons();

  int err = setupWifi();
  if (err < 0) {
    printf("Failed wifi :(");
  }

  display.setup();
}

void markDoneRPC(String eventId){
  printf("Marking done %s\n", eventId.c_str());
#if 0
  HttpClient http(base_client);
  int err = http.get("http://192.168.2.84/done/0");
  if (err < 0) {
    printf("Failed to mark task done");
  }
#end

}

void checkButtons() {
  bool anyChange = false;
  for (int i = 0; i < MAX_DISPLAYED_TASKS; i++){
    if ( taskButton[i] ) {
      printf("Button %d pressed\n", i)
      markDoneRPC(todo.taskList[i].eventId);
      todo.taskList[0]->isDone = 1;
      taskButton[i] = false;
      anyChange = true;
    }
  }

  if ( anyChange ) {
    display.render();
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
  display.render();
}
