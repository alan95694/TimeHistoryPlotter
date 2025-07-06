function deleteTemplate(app, optDeleteAll)
% 
% 
% 


if optDeleteAll
    hTmps = app.TmpTree.Children;
    
    for hCur = hTmps'
        app.TmpTree.SelectedNodes = hCur;
        deleteDelected(app);
    end
else
    deleteDelected(app);
end
   


end
%% =======================================================================================
function deleteDelected(app)

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











