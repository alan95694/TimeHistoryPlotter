function searchDataChannelNames(app, inpTxt)
% 
% 
% 

if isempty(app.tHData)
    return
end

fn = fieldnames(app.tHData.(app.LoadedFilesListBox.Value));

if isempty(inpTxt)
    app.DataChannelsListBox.Items = fn;
    return
end

% Extract matching names
matchedFields = fn( contains(fn, inpTxt, 'IgnoreCase',true) );

app.DataChannelsListBox.Items = matchedFields;

end
%% =======================================================================================