function deleteAxis(app)
% 
% 
% 


[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected template
if isempty(hh.ax)
    return
end

%% Delete selected axes

% Delete from tree
delete(hh.ax)

app.TmpTree.SelectedNodes = hh.tmp;

if isempty(hh.tmp.Children)
    % Make new axis if only axis were deleted
    guiControl.makeNewAxis(app);
else
    % Update check boxes and stuff
    guiControl.treeSelectionChanged(app, app.TmpTree.SelectedNodes , []);
end



end
%% =======================================================================================