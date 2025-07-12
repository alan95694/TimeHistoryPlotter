function searchDataChannelNames(app, inpTxt)
% 
% 
% 

if isempty(app.tHData)
    return
end

strTmp = matlab.lang.makeValidName(app.LoadedFilesListBox.Value);
fn = fieldnames(app.tHData.(strTmp));

if isempty(inpTxt)
    app.DataChannelsListBox.Items = fn;
    return
end

% Extract matching names
matchedFields = fn( contains(fn, inpTxt, 'IgnoreCase',true) );

app.DataChannelsListBox.Items = matchedFields;

end
%% =======================================================================================