function hLineNode = makeNewLine(app)
% 
% 
% 



%% Save where we are at
if ~isempty(app.TmpTree.SelectedNodes)
    hh = guiControl.guiTreeNodeCom.saveAllGuiToNode(app, app.TmpTree.SelectedNodes);
end


%% Add line node

% --- new line node --- 
hLineNode = uitreenode(hh.ax, ...
        'Text', '<null>', ...
        'tag', 'line');

app.TmpTree.SelectedNodes = hLineNode;
guiControl.setDefaults.line(app, hLineNode);
guiControl.guiTreeNodeCom.treeNodeToGui(app, hLineNode);

%% Expand tree
% not sure we need anything here?


end
%% =======================================================================================