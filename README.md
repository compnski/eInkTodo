# E-Ink Todo List

A mess of Arduino C++, a local python proxy and some google apps script.

## Google Apps Script
This is used to get the calendar events and format into a easily parsable list. Copy the code from googleAppScript.gs into a project.
Then update the calendarId with your own, deploy it as a webapp and you're in business!
https://script.google.com/

## todoProxy.py
I was having an awful lot of trouble connecting to google via SSL. In particular, the apps script webapp sends a few Location header redirects and my ESP32 would get stuck after following one or two. No idea why.

My fix was to set up a local proxy on my computer. This also removes the need for an SSL client, removing one more troublesome part from the equation.

Update the taskURL with the URL of your google app script webapp, and you're good to go.

The /done/ stuff is hardcoded and not ready yet, eventually it'll take the event Id to mark it complete.

## Arduino code
This stuff is a huge pile of spaghetti C++. It's been maybe 10 years since I last wrote anything with C++ and it shows.
I've also not done too much Arduino, so have no idea how to setup the file structure.

For this, symlink todo.cpp into your Arduino folder as anything with a .ino file extension. Then add your SSID/password + taskURL. (Or create a secrets.h and copy/symlink that over too).

Then symlink the two library folders, HttpClient and TodoList into ~/Arduino/libraries, they should be found automatically.

You'll also need the ESP32 SDK and the waveshare SDK -- I used instructions from the waveshare wiki -- https://www.waveshare.com/wiki/7.5inch_HD_e-Paper_HAT_(B).

## Troubleshooting
The wifi only seems to connect like 1 in 100 times. It worked great in the prototype step, now, not so much. Good luck!

## TODO

1. Fetch temp / weather ?
1. Look into adding lines across for style
1. Checkmark for completed tasks
1. Red color for overdue tasks
1. Read buttons for done
1. Flash LED on overdue
1. Fix spacing and all that
1. Speaker / sound
1. Neopixels on top
1. Korean word of the day?? (First todo?)
