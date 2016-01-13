function listMarketCat = BetfairBot(username, password, applicationKey)

token = BetfairLogin(username, password, applicationKey);
keepAliveStatus = BetfairKeepAlive(applicationKey, token);

% GB football matches
jsonBody = '{"filter" : {"eventTypeIds": [1], "marketCountries": ["GB"]}}';
listEvents = BetfairPost('listEvents/', jsonBody, applicationKey, token);

for i = 1:numel(listEvents)
    i
    jsonBody = ['{"filter" : {"eventIds": [' listEvents{i}.event.id '], "marketTypeCodes": ["MATCH_ODDS"]}, "maxResults":200}'];
    listMarketCat{i} = BetfairPost('listMarketCatalogue/', jsonBody, applicationKey, token);
end



