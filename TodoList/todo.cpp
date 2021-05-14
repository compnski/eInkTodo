#include "todo.h"

const String TASK_SEPARATOR = " ||| ";

TodoList::TodoList(const char *taskURL) : taskURL(taskURL), numClientTasks(0) {
  for (int i = 0; i < MAX_DISPLAYED_TASKS; i++) {
    this->taskList[i] = NULL;
  }
}

boolean assertState(SEQUENCE_STATE currentState, SEQUENCE_STATE expectedState) {
  if (currentState != expectedState) {
    printf("Out of order state, current: %s, expected %s\n", currentState,
           expectedState);
    return false;
  }
  return true;
}

int TodoList::updateTasks(HttpClient *client) {
  int err;
  err = this->makeServerRequest(client);
  if (err == 0) {
    err = this->processServerResponse(client);
  } else {
    printf("Failed to make request");
  }

  this->cleanupRequest(client);
  return err;
}

int TodoList::makeServerRequest(HttpClient *client) {
  this->state = SEQ_CONNECTING;
  int err = client->get(this->taskURL);
  if (err < 0) {
    return err;
  }
  this->state = SEQ_CONNECTED;
  printf("Request OK\n");
  return 0;
}

int TodoList::processServerResponse(HttpClient *client) {
  if (!assertState(this->state, SEQ_CONNECTED)) {
    return -1;
  }
  this->state = SEQ_READING_BODY;

  int err;
  err = processDateLine(client->readLine());
  if (err < 0) {
    printf("Failed to parse dateline\n");
    this->cleanupRequest(client);
    return err;
  }

  this->totalServerTasks = client->readLine().toInt();
  if (this->totalServerTasks > MAX_DISPLAYED_TASKS) {
    printf("Too many tasks, displaying top %d\n", MAX_DISPLAYED_TASKS);
    this->numClientTasks = MAX_DISPLAYED_TASKS;
  } else {
    this->numClientTasks = this->totalServerTasks;
  }
  printf("Processing %d tasks\n", this->numClientTasks);
  for (int i = 0; i < this->numClientTasks; i++) {
    String line = client->readLine();
    this->processTaskLine(line, i);
  }

  this->state = SEQ_FINISHED_BODY;
  return 0;
}

int TodoList::processDateLine(String line) {
  printf("Processing date line [%s]\n", line.c_str());
  if (!assertState(this->state, SEQ_READING_BODY)) {
    return -1;
  }

  int firstSpace = line.indexOf(' ');
  if (firstSpace < 0) {
    return -1;
  }
  this->lastTimestamp = line.substring(0, firstSpace).toInt();
  this->lastTimestring = line.substring(firstSpace);
  this->lastTimestring.trim();
  return 0;
}

int TodoList::processTaskLine(String line, int index) {
  printf("Processing task line [%s] for %d\n", line.c_str(), index);
  if (!assertState(this->state, SEQ_READING_BODY)) {
    return -1;
  }
  if (this->taskList[index] != NULL) {
    delete (this->taskList[index]);
  }
  this->taskList[index] = new Task(line);
  return 0;
}

String nextItem(String line, int offset) {
  int sepIndex = line.indexOf(TASK_SEPARATOR);
  return line.substring(offset, sepIndex);
}

Task::Task(String line) {
  // Todo Task 2 ||| 0 ||| 1620845100 ||| 1620848700 |||
  // 1dadttb4r0b1pc21p2ijm66apk@google.com
  int nextOffset = 0;

  this->title = nextItem(line, 0);
  nextOffset += this->title.length();
  this->title.replace("||||||", "|||");

  String doneStr = nextItem(line, nextOffset);
  this->isDone = doneStr.toInt();
  nextOffset += doneStr.length();

  String startAtStr = nextItem(line, nextOffset);
  this->startAtTs = startAtStr.toInt();
  nextOffset += startAtStr.length();

  String dueAtStr = nextItem(line, nextOffset);
  this->dueAtTs = dueAtStr.toInt();
  nextOffset += dueAtStr.length();

  this->eventId = nextItem(line, 0);
}

bool Task::isOverdue(int currentTime) { return currentTime > dueAtTs; }

void TodoList::cleanupRequest(HttpClient *client) {
  client->stop();
  this->state = SEQ_WAITING;
}
