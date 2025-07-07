function deleteLine(app)
% 
% 
% 


% Get selected line
[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected line
if isempty(hh.line)

    if length(hh.ax.Children) == 1
        hh.line = hh.ax.Children;
    else
        return
    end
end

%% Delete selected axes

% Delete from tree
delete( hh.line )


app.TmpTree.SelectedNodes = hh.ax;

if isempty(hh.ax.Children)
    % Make new line if only line were deleted
    guiControl.makeNewLine(app);
else
    % Update check boxes and stuff
    guiControl.treeSelectionChanged(app, app.TmpTree.SelectedNodes , []);
end



end
%% =======================================================================================