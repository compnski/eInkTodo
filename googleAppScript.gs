
const RealPassword = '';
const calendarId = '';

function fakeGetWithPassword() {
  doGet({"parameter":{"password": RealPassword}});
}

function fakeGetWrongPassword() {
  doGet({"parameter":{"password": "foobar"}});
}

function fakeGetNoPassword() {
  doGet({"parameter":{}});
}

const doGet = (event = {}) => {
  const { parameter } = event;
  const { password = 'Unknown', done="false" } = parameter;
  //if (password != RealPassword) {
  //  return ContentService.createTextOutput("BAD PASSWORD");
  //}
  if (done != "false") {
    const calendar = CalendarApp.getCalendarById(calendarId);
    var evt = calendar.getEventById(done);
    evt.setTag("done", true);
  }


  const upcomingEvents = listUpcomingEvents();
  const now = new Date();
  const nowMs = Math.floor(Date.now() / 1000);
  const timeString = `${now.toLocaleDateString()} ${now.toLocaleTimeString()}`
  const output = `${nowMs} ${timeString}\n${upcomingEvents.length}\n${upcomingEvents.join("\n")}`
  Logger.log(output);
  return ContentService.createTextOutput(output);
};

function listUpcomingEvents() {
  var results = [];
  const calendar = CalendarApp.getCalendarById(calendarId);
  const events = calendar.getEventsForDay(new Date());
  if (events.length > 0) {
    for (i = 0; i < events.length; i++) {
      const event = events[i];
      const dueAt = event.getEndTime().valueOf();
      var title = event.getTitle();
      const iCalID = event.getId();
      const isDone = event.getTag("done") ? "1" : "0";
      if(title.includes("|||")) {
        title = title.replace("|||", "||||||");
      }
      results.push(`${title} ||| ${isDone} ||| ${dueAt} ||| ${iCalID}`);
    }
  } else {
    Logger.log('No upcoming events found.');
  }
  Logger.log(results);
  return results;
}

function truncateDate(date) {
    return new Date(date.toDateString());
}
