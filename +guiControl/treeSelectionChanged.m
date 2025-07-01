function treeSelectionChanged(app,  hNode, hNodeLast)
% 
% 
% 




%% Save into tree nodes
if ~isempty(hNodeLast)
    guiControl.guiTreeNodeCom.saveAllGuiToNode(app, hNodeLast);
end


%% Update Gui from 
% Redraw all as could be in a different template or axis

hSel = guiControl.getEditableNodeHandles(hNode);

guiControl.guiTreeNodeCom.treeNodeToGui(app, hSel.tmp);

if isempty(hSel.ax)
    guiControl.guiTreeNodeCom.treeNodeToGui(app, hSel.tmp.Children(1) );  
else
    guiControl.guiTreeNodeCom.treeNodeToGui(app, hSel.ax);  
end

if isempty(hSel.line)
    guiControl.guiTreeNodeCom.treeNodeToGui(app, hSel.tmp.Children(1).Children(1));
else
    guiControl.guiTreeNodeCom.treeNodeToGui(app, hSel.line);
end
     

%% Update editable status
guiControl.updateAxisLineEditable(app, hSel);




end
%% =======================================================================================








