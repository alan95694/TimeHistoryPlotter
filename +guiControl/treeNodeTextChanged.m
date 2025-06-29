function treeNodeTextChanged(app, node)
% 
% 
% 


[itmp, iax, iline] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

switch node.NodeData.type
    case {'tmp'}
        app.templates{itmp}.name = node.Text;
    case {'axis'}
        app.templates{itmp}.axis{iax}.name = node.Text;
    case {'line'}
        app.templates{itmp}.axis{iax}.line{iline}.name = node.Text;
end



end
%% =======================================================================================