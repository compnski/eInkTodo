#include "HttpClient.h"

#include <SSLClient.h>

#include "trust_anchor.h"

String parseLocationHeader(String header) {
  // TODO: Length checks
  // Location:
  // https://script.googleusercontent.com/macros/echo?user_content_key=Y2UUDSIHH0l1r6b5HoPdTGLf5YYYdvRbNdL3a-QG9wMGL0-7GXh7yuUKj4XzQpZKe9ymMLZKuju4ec_-mWPG-31LtJGKYMKim5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnF0PN_5c0Ix_Scl8Tf76QSE0PY8zvTcQQ7sT6gs2niJzYKD8-tfO6K_fe897KdcmM_Ripi-Nx1glLpRqzStWsylaLwHglm9Nd9z9Jw9Md8uu&lib=MLJCpyHwh-1nJBkeO-PfziuMMsrZlQYlo
  int firstColonOffset = header.indexOf(':');
  String headerUrl = header.substring(firstColonOffset + 1);
  headerUrl.trim();
  printf("Got redirect to [%s]\n", headerUrl.c_str());
  return headerUrl;
}

HttpClient::HttpClient(Client &client) : HttpClient(&client) {}
HttpClient::HttpClient(Client *client) : baseClient(client) {}

void HttpClient::resetSSLClient() {
  // if (this->baseClient) {
  //   delete (this->baseClient);
  // }
  // this->baseClient = new SSLClient(*this->baseClient, TAs, (size_t)TAs_NUM,
  // 34,
  //                                 4, SSLClient::SSL_INFO);
}

int HttpClient::get(String url) {
  makeRequest(url, VERB_GET);
  return 0;
}

int HttpClient::makeRequest(String url, Verb verb) {
  return makeRequest(url, verb, "", 0);
}

int HttpClient::makeRequest(String url, Verb verb, const char *formData) {
  return makeRequest(url, verb, formData, 0);
}

int HttpClient::makeRequest(String url, Verb verb, const char *formData,
                            int redirectCount) {
  resetSSLClient();
  const int HTTPS_SCHEME_LENGTH = 7;
  if (!url.startsWith("http://")) {
    return -1;
  }
  // baseClient->setTimeout(3000);
  // TODO: Length checks!
  int hostnameEndingSlashOffset = url.indexOf('/', HTTPS_SCHEME_LENGTH);
  String hostname =
      url.substring(HTTPS_SCHEME_LENGTH, hostnameEndingSlashOffset);
  String urlPath = url.substring(hostnameEndingSlashOffset);
  printf("Connecting to: hostname of %s, path of %s\n", hostname.c_str(),
         urlPath.c_str());

  int err = connectSSLClientForURL(hostname);
  if (err < 0) {
    printf("Failed to connect\n");
    return err;
  }
  baseClient->printf("GET %s HTTP/1.0\r\n", urlPath.c_str());
  baseClient->printf("User-Agent: ESP32 Task Manager\r\n");
  baseClient->printf("Host: %s\r\n", hostname.c_str());
  baseClient->printf("Connection: close\r\n\r\n");
  baseClient->flush();
  String location;
  while (true) {
    if (baseClient->connected()) {
      printf("Still connected\n");
    } else {
      printf("disconnected!\n");
      break;
    }
    // Wait for response data
    if (int ret = waitForData(5000) < 0) {
      return ret;
    }

    String line = baseClient->readStringUntil('\n');
    printf("header line? [%s]\n", line.c_str());

    // Check for redirects
    if (line.startsWith("Location:") || line.startsWith("location:")) {
      location = parseLocationHeader(line);
    }
    if (line == "\r") {
      printf("headers finished\n");
      break;
    }
    if (line.isEmpty()) {
      printf("Empty line\n");
      break;
    }
  }
  printf("Exiting Header Area\n");
  if (!location.isEmpty()) {
    if (redirectCount > MAX_REDIRECT_COUNT) {
      printf("Max redirect exceeded");
      return -1;
    }
    stop();
    printf("Following Location: header to %s\n", location.c_str());
    return makeRequest(location, verb, formData, redirectCount + 1);
  } else {
    printf("no redirect\n");
  }
  if (baseClient->connected()) {
    printf("disconnected :(");
    return 0;
  } else {
    return -1;
  }
}

int HttpClient::waitForData(int waitMillis) {
  unsigned long timeout = millis();
  while (baseClient->available() == 0) {
    if (millis() - timeout > waitMillis) {
      printf(">>> Client Timeout (headers) !\n");
      stop();
      return -1;
    }
  }
  return 0;
}

String HttpClient::readLine() {
  unsigned long timeout = millis();
  if (waitForData(5000) < 0) {
    String ret;
    return ret;
  }

  return baseClient->readStringUntil('\n');
}

int HttpClient::connectSSLClientForURL(String hostname) {
  return baseClient->connect(hostname.c_str(), 8080);
}

int HttpClient::available() { return baseClient->available(); }

int HttpClient::read() { return baseClient->read(); }

void HttpClient::stop() {
  // baseClient->flush();
  printf("Cleaning up\n\n");
  if (baseClient->available()) {
    printf("Clearing buffer\n");
    while (baseClient->available()) {
      printf("%c.", baseClient->read());
    }
    printf("Data Recv\n\n");
  }

  baseClient->stop();
}
