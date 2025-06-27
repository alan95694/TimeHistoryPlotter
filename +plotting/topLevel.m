function topLevel(app)
% 
% 
% 

if isempty(app.tHData) || length(fieldnames(app.tHData)) == 0
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
curTHData   = app.tHData.(...
            matlab.lang.makeValidName(app.LoadedFilesListBox.Value));

%% Make the plot

disp(' ')
fprintf('Plotting file: "%s", with template: "%s"\n', app.LoadedFilesListBox.Value, curTemplate.name);

hwb = uiprogressdlg(app.TimeHistoryPlotterUIFigure, ...
        'Title', 'Please Wait',...
        'Message', 'Plotting, please wait');
drawnow

[bMissingData] = plotting.plotFigure(curTemplate, curTHData, ...
        app.TimeHistoryPlotterUIFigure, app.LoadedFilesListBox.Value);

hwb.Value = 1.0; 
drawnow
delete(hwb)

if (bMissingData)
    uialert(app.TimeHistoryPlotterUIFigure, ...
        {'One or more data channels not found in data set.'; ...
        'See Command Window for details'}, ...
        'warning', ...
        "Icon","warning");
end


end
%% =======================================================================================















