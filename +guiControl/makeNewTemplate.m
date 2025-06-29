function makeNewTemplate(app)
% 
% 
% 




%% Setup template with defaults

if isempty(app.templates)
    itmp = 1;
else
    itmp = length(app.templates) + 1;
end
app.templates{itmp}.name = 'template';

% Figure level properties
guiControl.setDefaults.figure(app, itmp);

% First axis properties
guiControl.setDefaults.axis(app, itmp, 1, 'Axis 1');

% Declare first line
guiControl.setDefaults.line(app, itmp, 1, 1, '<null>');

%% Add a template to the uitree


% Make new template node
app.templates{itmp}.hNode = uitreenode(app.TmpTree, ...
        'Text', app.templates{itmp}.name);

app.templates{itmp}.hNode.NodeData.type  = 'tmp';

% Add Axis nodes
iax = 1;
% Make new axis node
app.templates{itmp}.axis{iax}.hNode = uitreenode(...
    app.templates{itmp}.hNode, ...
    'Text', app.templates{itmp}.axis{iax}.name);

app.templates{itmp}.axis{iax}.hNode.NodeData.type   = 'axis';

iline = 1;
app.templates{itmp}.axis{iax}.line{iline}.hNode = ...
    uitreenode(app.templates{itmp}.axis{iax}.hNode, ...
        'Text', app.templates{itmp}.axis{iax}.line{iline}.name);

app.templates{itmp}.axis{iax}.line{iline}.hNode.NodeData.type   = 'line';

% Make new template the selected one
app.TmpTree.SelectedNodes = app.templates{itmp}.hNode;
expand(app.templates{itmp}.hNode, 'all')

end
%% =======================================================================================



















