function makeNewAxis(app)
% 
% 
% 


% Get selected template
[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected template
if isempty(hh.tmp)
    return
end

%% Add Axis nodes
% --- new axis node --- 
axisNode = uitreenode(hh.tmp, ...
        'Text', 'Axis', ...
        'tag', 'axis');

guiControl.setDefaults.axis(app, axisNode);
guiControl.nodeDataToGui.axis(app, axisNode);

% --- new line node --- 
lineNode = uitreenode(axisNode, ...
        'Text', '<line>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.nodeDataToGui.line(app, lineNode);

%% Expand tree
expand(axisNode)
app.TmpTree.SelectedNodes = axisNode;



end
%% =======================================================================================