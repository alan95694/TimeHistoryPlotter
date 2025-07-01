function axis(app, curNode)
% 
% 
% 


for fn = fieldnames(curNode.NodeData)'
    app.(curNode.NodeData.(fn{1}).guiHand).Value = ...
        curNode.NodeData.(fn{1}).value;
end


end