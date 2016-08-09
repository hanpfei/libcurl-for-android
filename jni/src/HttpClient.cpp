#include <string>
#include <sstream>
#include <map>

#include "curl/curl.h"

#include "JNIHelper.h"

#include "HttpClient.h"

#define TAG "p2p/HttpClient"

const std::string HttpClient::DEFAULT_USER_AGENT0 =
        "AppleCoreMedia/1.0.0.9A405 (iPad; U; CPU OS 5_0_1 like Mac OS X; zh_cn)";
const std::string HttpClient::DEFAULT_USER_AGENT1 =
        "Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3";
const std::string HttpClient::DEFAULT_USER_AGENT2 =
        "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53";

HttpClient::HttpClient() {
}

HttpClient::~HttpClient() {
}

size_t function( void *ptr, size_t size, size_t nmemb, void *stream) {
    std::string *html = (std::string *)stream;
    size_t datasize = size * nmemb;
    html->append((char *)ptr, datasize);
    return datasize;
}

int HttpClient::getHtml(const std::string &url, std::string& html, const std::string &userAgent) {
    CURL *curl = curl_easy_init();

    CURLcode curlcode = curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curlcode = curl_easy_setopt(curl, CURLOPT_HTTPGET, 1L);

    if (!userAgent.empty()) {
        curl_easy_setopt(curl, CURLOPT_USERAGENT, userAgent.c_str());
    }

    // For Redirection.
    curlcode = curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
    curlcode = curl_easy_setopt(curl, CURLOPT_MAXREDIRS, (long)MAX_REDIRECT);

    // For timeout
    curlcode = curl_easy_setopt(curl, CURLOPT_NOSIGNAL, 1L);
    curlcode = curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, (long)1);
    curlcode = curl_easy_setopt(curl, CURLOPT_TIMEOUT, (long)TIMEOUT_SECONDS);

    // For TCP connection.
    curl_easy_setopt(curl, CURLOPT_FORBID_REUSE, 1L);
    curl_easy_setopt(curl, CURLOPT_FRESH_CONNECT, 1L);
    curl_easy_setopt(curl, CURLOPT_PROTOCOLS, (long)CURLPROTO_HTTP);
    curl_easy_setopt(curl, CURLOPT_REDIR_PROTOCOLS, (long)CURLPROTO_HTTP);

    curl_easy_setopt(curl, CURLOPT_ACCEPT_ENCODING, "");

    struct curl_slist *curlheaders = NULL; /* init to NULL is important */
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, curlheaders);

    curlcode = curl_easy_setopt(curl, CURLOPT_WRITEDATA, &html);
    curlcode = curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, function);

    curlcode = curl_easy_perform(curl);
    if (curlcode != CURLE_OK) {
        LOGW("curl_easy_perform return code %d", curlcode);
        //TODO ?
    }

    long retcode = 0;
    curlcode = curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE , &retcode);
    if (curlcode != CURLE_OK || retcode != 200) {
        LOGW("Get %s failed, curlcode %d, retcode %ld, html size %d!!!", url.c_str(), curlcode, retcode, html.size());
        html.clear();
    }

#ifdef DEBUG_
    char *localIp = NULL;
    curlcode = curl_easy_getinfo(curl, CURLINFO_LOCAL_IP , &localIp);
    long localPort = 0;
    curlcode = curl_easy_getinfo(curl, CURLINFO_LOCAL_PORT , &localPort);

    char *serverIp = NULL;
    curlcode = curl_easy_getinfo(curl, CURLINFO_PRIMARY_IP , &serverIp);
    long serverPort = 0;
    curlcode = curl_easy_getinfo(curl, CURLINFO_PRIMARY_PORT , &serverPort);

    double totoalTime = 0.0f;
    curlcode = curl_easy_getinfo(curl, CURLINFO_TOTAL_TIME, &totoalTime);
    if (curlcode == CURLE_OK && serverIp != NULL) {
        LOGD("getHtml %s, local address %s:%ld <===> Server address %s:%ld, total time %lf",
             url.c_str(), localIp, localPort, serverIp, serverPort, totoalTime);
    }
#endif

    curl_easy_cleanup(curl);
    curl_slist_free_all(curlheaders); /* free the header list */
    return retcode;
}

std::string HttpClient::constructUrl(const std::string &url, const std::map<std::string, std::string> &parameters) {
    std::string paramsUrl = url;
    std::string firstChar;
    int questionMarkIndex = paramsUrl.find('?');
    if (questionMarkIndex < 0) {
        firstChar = '?';
    } else if (questionMarkIndex == url.length() - 1) {
        firstChar = "";
    } else {
        firstChar = "&";
    }

    bool first = false;
    for (std::map<std::string, std::string>::const_iterator it = parameters.begin(); it != parameters.end(); ++it) {
        if (!first) {
            paramsUrl.append(firstChar);
            first = true;
        } else {
            paramsUrl.append("&");
        }
        paramsUrl.append(it->first);
        paramsUrl.append("=");
        paramsUrl.append(it->second);
    }
    return paramsUrl;
}
