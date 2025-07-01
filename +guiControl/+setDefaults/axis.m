function axis(app, curNode)
% 
% 
% 

% Put defaults into curNode.NodeData 

for fn = fieldnames(app.mapping.axis)'
    curNode.NodeData.(fn{1}) = app.mapping.axis.(fn{1});
end

end