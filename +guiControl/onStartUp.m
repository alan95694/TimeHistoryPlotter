function onStartUp(app)
% 
% 
% 
% 


app.LoadedFilesListBox.Items    = {''};
app.DataChannelsListBox.Items   = {''};

%% Get defaults & gui vs handle mapping
guiControl.defineMapping(app);


%% Make a default template
guiControl.makeNewTemplate(app);


end
%% =======================================================================================