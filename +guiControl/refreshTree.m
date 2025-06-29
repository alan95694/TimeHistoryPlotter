function refreshTree(app)
% 
% 
% 

warning('dont call me')
return


% newNode = uitreenode(app.Tree, 'Text', 'New Root Node');

% Redrawing the entire thing is fast
% delete(app.TmpTree.Children)


for itmp = 1:length(app.templates)

    % Make new template node
    app.templates{itmp}.hNode = uitreenode(app.TmpTree, ...
            'Text', app.templates{itmp}.name);

    app.templates{itmp}.hNode.NodeData.type  = 'tmp';
    app.templates{itmp}.hNode.NodeData.itmp  = itmp;
    app.templates{itmp}.hNode.NodeData.iax   = nan;
    app.templates{itmp}.hNode.NodeData.iline = nan;

    % Add Axis nodes
    for iax = 1:length(app.templates{itmp}.axis)
        % Make new axis node
        app.templates{itmp}.axis{iax}.hNode = uitreenode(...
            app.templates{itmp}.hNode, ...
            'Text', app.templates{itmp}.axis{iax}.name);

        app.templates{itmp}.axis{iax}.hNode.NodeData.type   = 'axis';
        app.templates{itmp}.axis{iax}.hNode.NodeData.itmp   = itmp;
        app.templates{itmp}.axis{iax}.hNode.NodeData.iax    = iax;
        app.templates{itmp}.axis{iax}.hNode.NodeData.iline  = nan;

        for iline = 1:length(app.templates{itmp}.axis{iax}.line)
            app.templates{itmp}.axis{iax}.line{iline}.hNode = ...
                uitreenode(app.templates{itmp}.axis{iax}.hNode, ...
                    'Text', app.templates{itmp}.axis{iax}.line{iline}.name);

            app.templates{itmp}.axis{iax}.line{iline}.hNode.NodeData.type   = 'line';
            app.templates{itmp}.axis{iax}.line{iline}.hNode.NodeData.itmp   = itmp;
            app.templates{itmp}.axis{iax}.line{iline}.hNode.NodeData.iax    = iax;
            app.templates{itmp}.axis{iax}.line{iline}.hNode.NodeData.iline  = iline;
        end
        
        % Expand axis (?)
        % expand(app.templates{itmp}.axis{iax}.hNode);
    end
    % Expand template
    % expand(app.templates{itmp}.hNode);    
end


end
%% =======================================================================================










