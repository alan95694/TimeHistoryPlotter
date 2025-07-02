function deleteFile(app)
% 
% 
% 




if isempty(app.LoadedFilesListBox.Items{1})
    % Nothing to delete
    return
end


% Find match (case-sensitive)
match = strcmp(app.LoadedFilesListBox.Items, app.LoadedFilesListBox.Value);

% Remove first match only
idx = find(match, 1);  % find index of first match
if ~isempty(idx)
    app.LoadedFilesListBox.Items(idx) = [];  % remove it

    app.tHData = rmfield(app.tHData, app.LoadedFilesListBox.Value);
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