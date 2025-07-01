function makeNewLine(app)
% 
% 
% 



%% Save where we are at
if ~isempty(app.TmpTree.SelectedNodes)
    hh = guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);
end


%% Add line node

% --- new line node --- 
lineNode = uitreenode(hh.ax, ...
        'Text', '<null>', ...
        'tag', 'line');

app.TmpTree.SelectedNodes = lineNode;
guiControl.setDefaults.line(app, lineNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, lineNode);

%% Expand tree
% not sure we need anything here?


end
%% =======================================================================================