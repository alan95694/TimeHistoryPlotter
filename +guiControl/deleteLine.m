function deleteLine(app)
% 
% 
% 


% Get selected line
[hh] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);

% Get selected line
if isempty(hh.line)
    return
end

%% Delete selected axes

% Delete from tree
delete( hh.line )

if isempty(hh.ax.Children)
    % Make new line if only line were deleted
    app.TmpTree.SelectedNodes = hh.ax;
    guiControl.makeNewLine(app);
end



end
%% =======================================================================================