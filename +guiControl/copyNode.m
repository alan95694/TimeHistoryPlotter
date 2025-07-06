function copyNode(app, sourceNode, targetParent)

if isempty(sourceNode)
    return
end

%% save to NodeData
guiControl.guiTreeNodeCom.saveAllGuiToNode(app, sourceNode);
guiControl.guiTreeNodeCom.saveAllGuiToNode(app, targetParent);

%% Create a new node under the target parent
newNode = uitreenode(targetParent, ...
    'Text', sourceNode.Text, ...
    'NodeData', sourceNode.NodeData, ...
    'Tag', sourceNode.Tag);

%% Update gui
guiControl.guiTreeNodeCom.treeNodeToGui(app, newNode);

%% Copy children recursively
for i = 1:numel(sourceNode.Children)
    guiControl.copyNode(app, sourceNode.Children(i), newNode);  % recursion
end

end
%% =======================================================================================