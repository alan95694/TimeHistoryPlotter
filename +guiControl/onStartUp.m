function onStartUp(app)
% 
% 
% 
% 



%% Remove defualt text from list boxes
app.LoadedFilesListBox.Items    = {''};
app.DataChannelsListBox.Items   = {''};
app.PlottingTemplatesListBox.Items = {''};
app.AxisListListBox.Items       = {''};
app.AxisListListBox.Items       = {''};
app.CurrentAxisListBox.Items    = {''};


app.IndependentChannelDropDown.Items = {'<null>'};

%% Make a default template
guiControl.makeNewTemplate(app, true);


end
%% =======================================================================================