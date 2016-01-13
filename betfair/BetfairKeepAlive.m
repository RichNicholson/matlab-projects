function keepAliveStatus = BetfairKeepAlive(applicationKey, token)

urlAlive = 'https://identitysso.betfair.com/api/keepAlive';

header1 = http_createHeader('X-Application', applicationKey);
header2 = http_createHeader('Accept', 'application/json');
header3 = http_createHeader('X-Authentication', token');

headerAlive = [header1, header2, header3];

[keepAlive, ~] = urlread2(urlAlive,'POST', [], headerAlive);
keepAlive = loadjson(keepAlive);

keepAliveStatus = keepAlive.status;