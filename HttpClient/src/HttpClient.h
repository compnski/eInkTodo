#ifndef __HTTP_CLIENT_H_
#define __HTTP_CLIENT_H_

#include "Arduino.h"
#include "Client.h"

const int MAX_REDIRECT_COUNT = 5;

typedef enum {
  VERB_GET = 0x00,
  VERB_POST = 0x01,
} Verb;

class HttpClient {
public:
  Client *sslClient;
  Client *baseClient;

  HttpClient(Client &);
  HttpClient(Client *);
  int get(String url);

  int available();
  int read();
  void stop();
  String readLine();

protected:
  bool _reqInProgress;

  int makeRequest(String url, Verb verb);
  int makeRequest(String url, Verb verb, const char *formData);
  int makeRequest(String url, Verb verb, const char *formData,
                  int redirectCount);
  int connectSSLClientForURL(String url);
  void resetSSLClient();
};

String parseLocationHeader(String header);

#endif // __HTTP_CLIENT_H_
