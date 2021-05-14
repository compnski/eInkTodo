#ifndef __TODO_DISPLAY_H_
#define __TODO_DISPLAY_H_

#include <DEV_Config.h>
#include <EPD.h>
#include <GUI_Paint.h>
#include <eink.h>

#include "Arduino.h"
#include "todo.h"

class TodoDisplay {
public:
  TodoDisplay(TodoList *todoList);
  TodoDisplay(TodoList &todoList);

  void setup();
  void cleanup();
  void render();

protected:
  // Image Cache
  UBYTE *BlackImage, *RYImage;
  TodoList *todoList;
  int *LedPins[MAX_DISPLAYED_TASKS];
  void drawFrame();
  void drawTasks();
};

#endif // __TODO_DISPLAY_H_
