function makeNewLine(app)
% 
% 
% 


% Get selected axis
[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected axis
if isempty(hh.ax)
    return
end



%% Add line node

% --- new line node --- 
lineNode = uitreenode(hh.ax, ...
        'Text', '<line>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.nodeDataToGui.line(app, lineNode);

%% Expand tree
% not sure we need anything here?


end
%% =======================================================================================