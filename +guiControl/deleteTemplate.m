function deleteTemplate(app, optDeleteAll)
% 
% 
% 

[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected template
if isempty(hh.tmp)
    return
end

%% Delete template data and tree node
delete( hh.tmp )

if isempty(app.TmpTree.Children)
    guiControl.makeNewTemplate(app);
end

app.TmpTree.SelectedNodes = app.TmpTree.Children(1);

%% Update check boxes and stuff
guiControl.treeSelectionChanged(app, app.TmpTree.SelectedNodes , []);



end
%% =======================================================================================











