function listBoxLoadedFilesChanged(app)
% 
% 
% 


if isempty(app.LoadedFilesListBox.Items)
    app.DataChannelsListBox.Items = {};
    return
end

% Update list of Data Channels
strSelected = app.LoadedFilesListBox.Value;
fn = fieldnames( app.tHData.( matlab.lang.makeValidName(strSelected)) );

app.DataChannelsListBox.Items = fn;
app.DataChannelsListBox.Value = fn{1};


%% Check / update independent channel pull down list
guiControl.independentChannel_DropDownOpen(app);


end