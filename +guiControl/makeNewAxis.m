function makeNewAxis(app)
% 
% 
% 



%% Save where we are at
if ~isempty(app.TmpTree.SelectedNodes)
    hh = guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);
end


%% Add Axis nodes
% --- new axis node --- 
axisNode = uitreenode(hh.tmp, ...
        'Text', 'Axis', ...
        'tag', 'axis');

app.TmpTree.SelectedNodes = axisNode;
guiControl.setDefaults.axis(app, axisNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, axisNode);

% --- new line node --- 
lineNode = uitreenode(axisNode, ...
        'Text', '<line>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, lineNode);

%% Expand tree
expand(axisNode)

%% Update visibility
app.AxisPropertiesPanel.Enable = true;
app.LinePropertiesPanel.Enable = true;

end
%% =======================================================================================