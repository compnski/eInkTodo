#ifndef __TODO_DISPLAY_H_
#define __TODO_DISPLAY_H_

#include <DEV_Config.h>
#include <EPD.h>
#include <GUI_Paint.h>
#include <eink.h>

#include "Arduino.h"
#include "todo.h"

class Latch {
public:
  Latch(const uint8_t (&addressPin)[3], const uint8_t dataPin,
        const uint8_t enablePin, const uint8_t resetPin);

  void reset();
  void set(uint8_t idx, uint8_t state);

protected:
  const uint8_t (&addressPins)[3];
  const uint8_t dataPin;
  const uint8_t enablePin;
  const uint8_t resetPin;

  void enable();
  void disable();
};

class TodoDisplay {
public:
  TodoDisplay(TodoList *todoList, Latch *ledLatch);
  TodoDisplay(TodoList &todoList, Latch &ledLatch);

  void setup();
  void cleanup();
  void render();

protected:
  // Image Cache
  UBYTE *BlackImage, *RYImage;
  TodoList *todoList;
  Latch *ledLatch;
  void drawFrame();
  void drawTasks();
};

#endif // __TODO_DISPLAY_H_
