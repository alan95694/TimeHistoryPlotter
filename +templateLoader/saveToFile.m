function saveToFile(app)
% 
% 
% 



if (false)
    file = fullfile('C:\Users\alanc\matlabProjects\HomeProjects_2025\TimeHistoryPlotter', 'templateSaveFile.tHPlotter');
else
    [file, path] = uiputfile({'*.tHPlotter'});
    if isequal(file,0) || isequal(path,0)
       return
    else
       file = fullfile(path, file);
       clear pathname filename
    end
end


%% get all templates
try
    optDisp = false;
    [~, templates] = guiControl.gatherTemplateIntoStruct(app, optDisp);
catch
    uialert(app.TimeHistoryPlotterUIFigure, "Error reading templates from GUI", ...
                "Save FAILED.", ...
                'Icon','error');
end

%% Write file
try
    save(file, 'templates', '-mat');

    uialert(app.TimeHistoryPlotterUIFigure, "File Save sucseeded", ...
                "Files Saved.", ...
                'Icon','success');
catch
    uialert(app.TimeHistoryPlotterUIFigure, "Error writting to file", ...
                "Save FAILED.", ...
                'Icon','error');
end




end
%% =======================================================================================