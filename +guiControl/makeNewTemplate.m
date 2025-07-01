function makeNewTemplate(app)
% 
% 
% 


% [itmp, iax, iline] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);


%% Setup template with defaults

if isempty(app.TmpTree)
    itmp = 1;
else
    itmp = length(app.TmpTree) + 1;
end

%% Make tree nodes

% --- new template node ---
tmpNode = uitreenode(app.TmpTree, ...
        'Text', 'template');

guiControl.setDefaults.figure(app, tmpNode);
guiControl.nodeDataToGui.figure(app, tmpNode);


% --- new axis node --- 
axisNode = uitreenode(tmpNode, ...
        'Text', 'Axis');

guiControl.setDefaults.axis(app, axisNode);
guiControl.nodeDataToGui.axis(app, tmpNode);

% --- new line node --- 

lineNode = uitreenode(axisNode, ...
        'Text', '<line>');

guiControl.setDefaults.line(app, lineNode);
guiControl.nodeDataToGui.line(app, lineNode);

%% Make gui tree look good
expand(tmpNode, 'all')
app.TmpTree.SelectedNodes = tmpNode;



end
%% =======================================================================================



















