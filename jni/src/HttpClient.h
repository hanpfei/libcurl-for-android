#ifndef __MORETV_HTTP_HTTPCLIENT_H__
#define __MORETV_HTTP_HTTPCLIENT_H__

#include <string>
#include <map>

const int HTTP_RESULT_CODE_SUCCESS = 200;
const int HTTP_RESULT_CODE_NOT_FOUND = 404;
const int HTTP_RESULT_CODE_UNKNOWN_KEY = 500;

class HttpClient {
public:
    virtual ~HttpClient();

    static int getHtml(const std::string &url, std::string& html, const std::string &userAgent = "");

    static std::string constructUrl(const std::string &url, const std::map<std::string, std::string> &parameters);

public:
    static const std::string LogServerUrl;

public:
    static const std::string DEFAULT_USER_AGENT0;
    static const std::string DEFAULT_USER_AGENT1;
    static const std::string DEFAULT_USER_AGENT2;

private:
    static const int TIMEOUT_SECONDS = 2; // time out in second
    static const int MAX_REDIRECT = 5; // max redirect times

    const static std::string ServerHostAddr;

    HttpClient();
};

#endif//__MORETV_HTTP_HTTPCLIENT_H__
