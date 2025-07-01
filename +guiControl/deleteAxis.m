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

if isempty(hh.tmp.Children)
    % Make new axis if only axis were deleted
    app.TmpTree.SelectedNodes = hh.tmp;
    guiControl.makeNewAxis(app);
end


end
%% =======================================================================================