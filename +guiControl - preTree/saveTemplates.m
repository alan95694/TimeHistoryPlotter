function saveTemplates(app)
% 
% 
% 


%% Get where to save to
if (false)
    [fileName, pathName] = uiputfile('*.thpTemplate', 'Save As');
else
    fileName = 'dummyFile.thpTemplate';
    pathName = 'C:\Users\alanc\matlabProjects\HomeProjects_2025\TimeHistoryPlotter\';
end


%% Save to file
templates = app.templates;
save(fullfile(pathName, fileName), 'templates');

%% Talk to user
uialert(app.TimeHistoryPlotterUIFigure, "All avalible template(s) saved to file.", ...
    "File Saved.", ...
    "Icon","success");

end
%% =======================================================================================



















