function topLevel(app, file)
% 
% 
% 


if ~exist('file','var')
    [filename, pathname] = uigetfile('*.*', 'Pick a time history file');
    
    if isequal(filename,0) || isequal(pathname,0)
       return
    else
       file = fullfile(pathname, filename);
       clear pathname filename
    end
end

[FILEPATH, NAME, EXT] = fileparts(file);


% Confirm overwrite of already loaded data
if isfield(app.tHData, NAME)
    selection = uiconfirm(app.TimeHistoryPlotterUIFigure, ...
                    'Overwrite already loaded data?', ...
                    'Overwirte?', ...
                    "Options",["Overwrite", "Cancel"], ...
                    "DefaultOption", 2,"CancelOption", 2);
    if strcmp(selection, 'Cancel')
        return
    end
end


%% Read file
% Read CSV file into a table
% T = readtable(file, ReadRowNames = true);
T = readtable(file);

% Convert table to structure (column-wise fields)
S = table2struct(T, 'ToScalar', true);
S.rowIndex = (1:height(T))';

%% Store data into app
varNAME = matlab.lang.makeValidName(NAME);
app.tHData.(varNAME) = S;


%% update gui

% Add name to list box
if isempty(app.LoadedFilesListBox.Items{1})
    app.LoadedFilesListBox.Items{1} = NAME;
else
    app.LoadedFilesListBox.Items{end+1} = NAME;
end
app.LoadedFilesListBox.Value = NAME;

guiControl.listBoxLoadedFilesChanged(app);




end
