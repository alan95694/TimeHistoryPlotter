function guiToTreeNode(app, curNode)
% 
% 
% 


for fn = fieldnames(curNode.NodeData)'
    curNode.NodeData.(fn{1}).value = ...
        app.(curNode.NodeData.(fn{1}).guiHand).Value;
end


end