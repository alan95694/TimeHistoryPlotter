function deleteFile(app)
% 
% 
% 


if isempty(app.LoadedFilesListBox.Items) 
    return
end

iFile  = find(strcmp( ...
    app.LoadedFilesListBox.Items, ...
    app.LoadedFilesListBox.Value) );

%% Remove data loaded data structure
app.tHData = rmfield(app.tHData, app.LoadedFilesListBox.Value);

%% Update list box
app.LoadedFilesListBox.Items(iFile) = [];

%% Update Data Channels list
guiControl.listBoxSelectedChanged.loadedFiles(app);

end
%% =======================================================================================