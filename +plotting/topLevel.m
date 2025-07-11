function topLevel(app)
% 
% 
% 

if isempty(app.tHData) || isempty(fieldnames(app.tHData))
    uialert(app.TimeHistoryPlotterUIFigure, ...
        'No time history data loaded.', 'Error');
    return
end



%% Save gui into template
guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);


%% Gather data
optDisp = false;
curTemplate = guiControl.gatherTemplateIntoStruct(app, optDisp);
curTHData   = app.tHData.(...
            matlab.lang.makeValidName(app.LoadedFilesListBox.Value));

%% Make the plot

disp(' ')
fprintf('Plotting file: "%s", with template: "%s"\n', app.LoadedFilesListBox.Value, curTemplate.name);

hwb = uiprogressdlg(app.TimeHistoryPlotterUIFigure, ...
        'Title', 'Please Wait',...
        'Message', 'Plotting, please wait');
drawnow

[bMissingData, strError] = plotting.plotFigure(curTemplate, curTHData, ...
        app.TimeHistoryPlotterUIFigure, app.LoadedFilesListBox.Value);

hwb.Value = 1.0; 
drawnow
delete(hwb)

if ~isempty(strError)
    uialert(app.TimeHistoryPlotterUIFigure, ...
        strError, 'error', ...
        "Icon", "error");
end

if (bMissingData)
    uialert(app.TimeHistoryPlotterUIFigure, ...
        {'One or more data channels not found in data set.'; ...
        'See Command Window for details'}, ...
        'warning', ...
        "Icon","warning");
end


end
%% =======================================================================================















