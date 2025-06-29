function makeNewAxis(app)
% 
% 
% 


% Get selected template
[itmp] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);
if isempty(itmp)
    return
end

%% Put new things into data structure
iaxNew   = length(app.templates{itmp}.axis) + 1;
ilineNew = 1;
% First axis properties
guiControl.setDefaults.axis(app, itmp, iaxNew, sprintf('Axis %d', iaxNew) );

% Declare first line
guiControl.setDefaults.line(app, itmp, iaxNew, ilineNew, '<null>');

%% Add Axis nodes

% Make new axis node
app.templates{itmp}.axis{iaxNew}.hNode = uitreenode(...
    app.templates{itmp}.hNode, ...
    'Text', app.templates{itmp}.axis{iaxNew}.name);

app.templates{itmp}.axis{iaxNew}.hNode.NodeData.type   = 'axis';

iline = 1;
app.templates{itmp}.axis{iaxNew}.line{iline}.hNode = ...
    uitreenode(app.templates{itmp}.axis{iaxNew}.hNode, ...
        'Text', app.templates{itmp}.axis{iaxNew}.line{iline}.name);

app.templates{itmp}.axis{iaxNew}.line{iline}.hNode.NodeData.type   = 'line';

%% Expand tree
expand(app.templates{itmp}.axis{iaxNew}.hNode.Parent, 'all')
app.TmpTree.SelectedNodes = app.templates{itmp}.axis{iaxNew}.hNode;

end
%% =======================================================================================