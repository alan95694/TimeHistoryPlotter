function makeNewLine(app)
% 
% 
% 


% Get selected template
[itmp, iax, iline] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);
if isempty(itmp)
    return
end

%% Put new things into data structure
if isnan(iax)
    % assume first axis
    iax = 1;
end

if isnan(iline)
    ilineNew = length(app.templates{itmp}.axis{iax}.line) + 1;
else
    ilineNew = iline + 1;
end

% Declare first line
guiControl.setDefaults.line(app, itmp, iax, ilineNew, '<null>');


%% Add line nodes
app.templates{itmp}.axis{iax}.line{ilineNew}.hNode = ...
    uitreenode(app.templates{itmp}.axis{iax}.hNode, ...
        'Text', app.templates{itmp}.axis{iax}.line{ilineNew}.name);

app.templates{itmp}.axis{iax}.line{ilineNew}.hNode.NodeData.type   = 'line';

%% Expand tree
expand(app.templates{itmp}.axis{iax}.hNode, 'all')
app.TmpTree.SelectedNodes = app.templates{itmp}.axis{iax}.line{ilineNew}.hNode;


end
%% =======================================================================================