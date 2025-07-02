function addCurrentToCurrentAxis(app, optUseCurAxis, optOverWrite)
% 
% 
% 



% Selected data channel
strDataChan = app.DataChannelsListBox.Value;

if (length(strDataChan) > 1 && optOverWrite)
    uialert(app.TimeHistoryPlotterUIFigure, ...
        "Cant add multiple data channels to one existing line.", ...
        "Selection Invalid"); % title
    return
end

% Make new axis
if ~optUseCurAxis
    hAxisNode = guiControl.makeNewAxis(app);
    delete(hAxisNode.Children(1)) % lines get added below
    expand(hAxisNode)
end

for ii = 1:length(strDataChan)

    if (optUseCurAxis)
        hh = guiControl.getEditableNodeHandles(app.TmpTree.SelectedNodes);

        if isempty(hh.line)
            uialert(app.TimeHistoryPlotterUIFigure, ...
                "Please select one Axis.", ...
                "Selection Invalid"); % title
            return
        end

        if ~isempty(hh.line) && (strcmp(hh.line.Text, '<null>') || optOverWrite)
            % overwrite
            hh.line.Text = strDataChan{1};
        elseif (~optOverWrite)
            % Make new line, put data channel on to it
            hNewLine = guiControl.makeNewLine(app);
            hNewLine.Text = strDataChan{1};
        end
    else
        hLineNode = guiControl.makeNewLine(app);
        hLineNode.Text = strDataChan{ii};
    end

end
     
if ~optUseCurAxis
    expand(hAxisNode)
end

end
%% =======================================================================================