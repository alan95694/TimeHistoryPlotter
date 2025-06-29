function refreshTree(app)
% 
% 
% 


% newNode = uitreenode(app.Tree, 'Text', 'New Root Node');

% Redrawing the entire thing is fast
delete(app.TmpTree.Children)


for itmp = 1:length(app.templates)

    % Make new template node
    app.templates{itmp}.hNode = uitreenode(app.TmpTree, ...
            'Text', app.templates{itmp}.name);        

    % Add Axis nodes
    for iax = 1:length(app.templates{itmp}.axis)
        % Make new axis node
        app.templates{itmp}.axis{iax}.hNode = uitreenode(...
            app.templates{itmp}.hNode, ...
            'Text', app.templates{itmp}.axis{iax}.name);

        for iline = 1:length(app.templates{itmp}.axis{iax}.line)
            app.templates{itmp}.axis{iax}.line{iline}.hNode = ...
                uitreenode(app.templates{itmp}.axis{iax}.hNode, ...
                    'Text', app.templates{itmp}.axis{iax}.line{iline}.name);
        end
        
        % Expand axis (?)
        % expand(app.templates{itmp}.axis{iax}.hNode);
    end
    % Expand template
    expand(app.templates{itmp}.hNode);    
end


end
%% =======================================================================================










