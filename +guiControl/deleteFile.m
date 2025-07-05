function deleteFile(app)
% 
% 
% 


% Nothing to delete
if isempty(app.LoadedFilesListBox.Items)
    return
end
if isempty(app.LoadedFilesListBox.Items{1})
    return
end


% Find match (case-sensitive)
strDeleteMe = app.LoadedFilesListBox.Value;
match = strcmp(app.LoadedFilesListBox.Items, strDeleteMe);

% Remove first match only
idx = find(match, 1);  % find index of first match
if ~isempty(idx)
    app.LoadedFilesListBox.Items(idx) = [];  % remove it

    app.tHData = rmfield(app.tHData, strDeleteMe);
else
    error('did not find the thing.')
end


if ~isempty(app.LoadedFilesListBox.Items)
    app.LoadedFilesListBox.Value = app.LoadedFilesListBox.Items{1};
    guiControl.listBoxLoadedFilesChanged(app);
else
    app.DataChannelsListBox.Items = {''};
end










end
%% =======================================================================================