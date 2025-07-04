function treeNodeToGui(app, curNode)
% 
% 
% 




for fn = fieldnames(curNode.NodeData)'
    app.(curNode.NodeData.(fn{1}).guiHand).Value = ...
        curNode.NodeData.(fn{1}).Value;
end


end