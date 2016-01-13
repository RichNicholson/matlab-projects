function list = BetfairPost(endpoint, jsonBody, applicationKey, token)

url = ['https://api.betfair.com/exchange/betting/rest/v1.0/' endpoint];
headerApplication = http_createHeader('X-Application', applicationKey);

headerAuthentication = http_createHeader('X-Authentication', token);
headerContent = http_createHeader('content-type', 'application/json');
headerList = [headerApplication, headerAuthentication, headerContent];

[list, ~] = urlread2(url, 'POST', jsonBody, headerList);
list = loadjson(list);