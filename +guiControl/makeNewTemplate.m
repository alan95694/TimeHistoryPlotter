function makeNewTemplate(app)
% 
% 
% 


%% Save where we are at
if ~isempty(app.TmpTree.SelectedNodes)
    guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);
end

%% Make tree nodes

% --- new template node ---
tmpNode = uitreenode(app.TmpTree, ...
        'Text', 'template', ...
        'tag', 'tmp');

guiControl.setDefaults.figure(app, tmpNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, tmpNode);


% --- new axis node --- 
axisNode = uitreenode(tmpNode, ...
        'Text', 'Axis', ...
        'tag', 'axis');

guiControl.setDefaults.axis(app, axisNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, axisNode);

% --- new line node --- 

lineNode = uitreenode(axisNode, ...
        'Text', '<null>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, lineNode);

%% Make gui tree look good
expand(tmpNode, 'all')
app.TmpTree.SelectedNodes = tmpNode;

%% Update check boxes and stuff
guiControl.treeSelectionChanged(app,  tmpNode, []);

end
%% =======================================================================================



















