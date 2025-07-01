function makeNewTemplate(app)
% 
% 
% 



%% Make tree nodes

% --- new template node ---
tmpNode = uitreenode(app.TmpTree, ...
        'Text', 'template', ...
        'tag', 'tmp');

guiControl.setDefaults.figure(app, tmpNode);
guiControl.nodeDataToGui.figure(app, tmpNode);


% --- new axis node --- 
axisNode = uitreenode(tmpNode, ...
        'Text', 'Axis', ...
        'tag', 'axis');

guiControl.setDefaults.axis(app, axisNode);
guiControl.nodeDataToGui.axis(app, axisNode);

% --- new line node --- 

lineNode = uitreenode(axisNode, ...
        'Text', '<null>', ...
        'tag', 'line');

guiControl.setDefaults.line(app, lineNode);
guiControl.nodeDataToGui.line(app, lineNode);

%% Make gui tree look good
expand(tmpNode, 'all')
app.TmpTree.SelectedNodes = tmpNode;

end
%% =======================================================================================



















