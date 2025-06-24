function topLevel(app)
% 
% 
% 

if isempty(app.tHData)
    uialert(app.TimeHistoryPlotterUIFigure, ...
        'No time history data loaded.', 'Error');
    return
end

% What are we looking at
itmp    = guiControl.getCurrentTemplateNumber(app);
iaxis   = guiControl.getCurrentAxisNumber(app);
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);

%% Save gui into template
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);

%% Gather data
curTemplate = app.templates{itmp};
curTHData   = app.tHData.(app.LoadedFilesListBox.Value);

%% Make the plot
hWindow = app.TimeHistoryPlotterUIFigure;
plotting.plotFigure(curTemplate, curTHData, hWindow, app.LoadedFilesListBox.Value)


end
%% =======================================================================================