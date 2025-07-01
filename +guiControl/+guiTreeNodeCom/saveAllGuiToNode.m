function hh = saveAllGuiToNode(app, hNodes)
% 
% 
% 

if isempty(hNodes)
    return
end

hh = guiControl.getEditableNodeHandles(hNodes);

if ~isempty(hh.tmp)
    guiControl.guiTreeNodeCom.guiToTreeNode(app, hh.tmp);
else
    return
end
if ~isempty(hh.line)
    guiControl.guiTreeNodeCom.guiToTreeNode(app, hh.line);
end
if ~isempty(hh.ax)
    guiControl.guiTreeNodeCom.guiToTreeNode(app, hh.ax);
end


end