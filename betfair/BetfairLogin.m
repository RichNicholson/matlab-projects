function token = BetfairLogin(username, password, applicationKey)

url    = 'https://identitysso.betfair.com/api/login';
params = {'username' username 'password' password};

header1 = http_createHeader('X-Application', applicationKey);
header2 = http_createHeader('Accept', 'application/json');
header = [header1, header2];
[paramString] = http_paramsToString(params);

[login, extras] = urlread2(url,'POST', paramString, header);
login = loadjson(login);
token = login.token;