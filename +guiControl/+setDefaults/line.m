function line(app, curNode)
% 
% 
% 


for fn = fieldnames(app.mapping.line)'
    curNode.NodeData.(fn{1}) = app.mapping.line.(fn{1});
end

end