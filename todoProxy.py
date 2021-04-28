#!/usr/bin/env python

from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import time
import requests
from secrets import taskURL

hostName = "0.0.0.0"
serverPort = 8080
taskURL = ("https://script.google.com/macros/s/" +
                      "AKfycbzHMkp8f39ikoQpZ8jW4HfJR5vMUNapWZolaGGUNtpzMyxDYioH" +
                      "HWZKG7BWUMer49QBzg/exec")

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):

        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        if "/done/" in self.path:
            print("Got done request")
            requests.get(taskURL+"?done=5a9o76ubee84pe2i78g0bhs4p2@google.com")
            self.wfile.write(bytes("DONE\n", "utf-8"))
        else:
            self.return_tasks()

    def return_tasks(self):
        r = requests.get(taskURL)
        print("Got data:", r.text)
        self.wfile.write(bytes(r.text, "utf-8"))
        self.wfile.write(bytes("\n", "utf-8"))

if __name__ == "__main__":        
    webServer = ThreadingHTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
