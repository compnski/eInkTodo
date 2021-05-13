#ifndef __TODO_DISPLAY_H_
#define __TODO_DISPLAY_H_

#include "Arduino.h"
#include "todo.h"

class TodoDisplay {
  public:
  TodoDisplay(TodoList *todoList);
  TodoDisplay(TodoList &todoList);
  
  setup();
  cleanup();
  drawFrame();
  drawTasks();

  
protected:
  // Image Cache
  UBYTE *BlackImage, *RYImage;
  TodoList *todoList;
  int *LedPins[MAX_DISPLAYED_TASKS];
}


#endif // __TODO_DISPLAY_H_
