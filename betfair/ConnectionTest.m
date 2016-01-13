function Out = ConnectionTest(username, password, applicationKey)

%% Login and get Token

url    = 'https://identitysso.betfair.com/api/login';
params = {'username' username 'password' password};

header1 = http_createHeader('X-Application',applicationKey);
header2 = http_createHeader('Accept','application/json');

header = [header1, header2];

[paramString] = http_paramsToString(params)

options = weboptions('ContentType', 'json');

[login,extras] = urlread2(url,'POST',paramString,header);
login = loadjson(login);
token = login.token;

%% Keep Alive
disp('Keep Session Alive')
url_alive    = 'https://identitysso.betfair.com/api/keepAlive';

header1 = http_createHeader('X-Application',applicationKey);
header2 = http_createHeader('Accept','application/json');
header3 = http_createHeader('X-Authentication',token');

header_alive = [header1, header2, header3];

[keep_alive,extras] = urlread2(url_alive,'POST',[],header_alive);
keep_alive = loadjson(keep_alive);

keep_alive_status = keep_alive.status

%% Get Markets
url = 'https://api.betfair.com/exchange/betting/rest/v1.0/listEventTypes/';
header_application = http_createHeader('X-Application',applicationKey);

header_authentication = http_createHeader('X-Authentication',token');
header_content = http_createHeader('content-type','application/json');
header_list = [header_application, header_authentication, header_content];

json_body = '{"filter":{ }}';

[list,extras] = urlread2(url,'POST',json_body,header_list)

%% Get Events
url = 'https://api.betfair.com/exchange/betting/rest/v1.0/listEvents/';
header_application = http_createHeader('X-Application',applicationKey);

header_authentication = http_createHeader('X-Authentication',token');
header_content = http_createHeader('content-type','application/json');
header_list = [header_application, header_authentication, header_content];

json_body = '{"filter":{ }}';

[list,extras] = urlread2(url,'POST',json_body,header_list)