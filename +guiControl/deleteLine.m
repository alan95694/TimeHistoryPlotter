function deleteLine(app)
% 
% 
% 


% Get what templates have a selection 
[itmp, iax, iline] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);
if (isempty(itmp) || isnan(iax) || isnan(iline))
    return
end

%% Delete selected axes

% Delete from tree
delete( app.templates{itmp}.axis{iax}.line{iline}.hNode )

% Remove from data structure
if (length(app.templates{itmp}.axis{iax}.line) == 1)
    % Reset to default if line is only one in axis

    app.templates{itmp}.axis{iax}.line(1) = []; % delete

    % Make default axis into empty template
    app.TmpTree.SelectedNodes = app.templates{itmp}.axis{iax}.hNode;
    guiControl.makeNewLine(app);

else
    app.templates{itmp}.axis{iax}.line(iline) = [];
end


%% flash a thing
% guiControl.pauseAfterUiTreeUpdate(app, 'strText', 'Deleting line')

% debug
guiControl.print(app.templates);

end
%% =======================================================================================