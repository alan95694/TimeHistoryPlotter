function figure(app, curNode)
% 
% 
% 


% Put defaults into curNode.NodeData 

for fn = fieldnames(app.mapping.fig)'
    curNode.NodeData.(fn{1}) = app.mapping.fig.(fn{1});
end



end