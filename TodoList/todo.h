#ifndef __TODO_H_
#define __TODO_H_

#include "Arduino.h"
#include "Client.h"
#include <HttpClient.h>

class Task {
public:
  Task(String line);

  String title;
  int dueAtTs;
  int isDone;
};

typedef enum {
  TASK_STATE_NOTDONE = 0x00,
  TASK_STATE_DONE = 0x01,
} TASK_STATE;

typedef enum {
  SEQ_WAITING = 0x00,
  SEQ_CONNECTING = 0x10,
  SEQ_CONNECTED = 0x20,
  SEQ_READING_BODY = 0x40,
  SEQ_FINISHED_BODY = 0x45,
} SEQUENCE_STATE;

const int MAX_DISPLAYED_TASKS = 8;

class TodoList {
public:
  TodoList(const char *taskURL);
  int updateTasks(HttpClient *client);

  int lastTimestamp;
  String lastTimestring;
  Task *taskList[MAX_DISPLAYED_TASKS];
  int numClientTasks;
  int totalServerTasks;

protected:
  int makeServerRequest(HttpClient *client);
  int processServerResponse(HttpClient *client);
  void cleanupRequest(HttpClient *client);
  
  int processDateLine(String line);
  int processTaskLine(String line, int index);
  SEQUENCE_STATE state;

  String taskURL;
};

#endif // __TODO_H_
