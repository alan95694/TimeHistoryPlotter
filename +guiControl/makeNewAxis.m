function hAxisNode = makeNewAxis(app)
% 
% 
% 



%% Save where we are at
if ~isempty(app.TmpTree.SelectedNodes)
    hh = guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);
end


%% Add Axis nodes
% --- new axis node --- 
hAxisNode = uitreenode(hh.tmp, ...
        'Text', 'Axis', ...
        'tag', 'axis');

app.TmpTree.SelectedNodes = hAxisNode;
guiControl.setDefaults.axis(app, hAxisNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, hAxisNode);

% --- new line node --- 
lineNode = uitreenode(hAxisNode, ...
        'Text', '<null>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, lineNode);

%% Expand tree
expand(hAxisNode)

%% Update visibility
app.AxisPropertiesPanel.Enable = true;
app.LinePropertiesPanel.Enable = true;

end
%% =======================================================================================