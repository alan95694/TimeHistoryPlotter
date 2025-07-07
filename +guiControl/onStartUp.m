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

%% Read unit conversions
readUnits(app)


end
%% =======================================================================================
function readUnits(app)

path = mfilename('fullpath');
[parentFolder] = fileparts(path);
[grandParentFolder] = fileparts(parentFolder);

folderUnits = fullfile(grandParentFolder, '+units');

aa = dir(folderUnits);

bb = {aa.name}';
bb = {'none', bb{3:end}};
bb = cellfun(@(x) strrep(x, '.m', ''), bb, 'UniformOutput', false); % remove .m

app.UnitsConversionDropDown.Items = bb;
app.UnitsConversionDropDown.Value = 'none';

end
%% =======================================================================================