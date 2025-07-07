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

[grandParentFolder] = fileparts( fileparts( mfilename('fullpath') ) );

folder = fullfile(grandParentFolder, '+units');
aa = dir(folder);

bb = {aa.name}';
files = {'none', bb{3:end}};
names = cellfun(@(x) strrep(x, '.m', ''), files, 'UniformOutput', false); % remove .m

app.UnitsConversionDropDown.Items = names;
app.UnitsConversionDropDown.Value = 'none';

% Make tooltip info
app.cUnintsText = rearUnitsFiles( folder, files);


end
%% =======================================================================================
function out = rearUnitsFiles(folder, files)

out = [];
for curFile = {files{2:end}}
    fileID = fopen(fullfile(folder, curFile{1}), 'r');
    if (fileID == -1)
        out = [];
        return
    end
    
    fgetl(fileID); % burn
    str_Names   = fgetl(fileID); % names
    fgetl(fileID); % burn
    str_Math    = fgetl(fileID); % math
    fclose(fileID);

    out{end+1} = [str_Names, ': ', str_Math];
end

end
%% =======================================================================================






















