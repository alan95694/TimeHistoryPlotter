function deleteAxis(app)
% 
% 
% 


% Get what templates have a selection 
[itmp, iax] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);
if (isempty(itmp) || isnan(iax))
    return
end

%% Delete selected axes

% Delete from tree
delete(app.templates{itmp}.axis{iax}.hNode)

% Remove from data structure
if (length(app.templates{itmp}.axis) == 1)
    % Reset to default if axis is only one in template

    app.templates{itmp}.axis(1) = []; % delete

    % First axis properties
    guiControl.setDefaults.axis(app, itmp, 1, 'Axis 1');

    % Declare first line
    guiControl.setDefaults.line(app, itmp, 1, 1, '<null>');

else
    app.templates{itmp}.axis(iax) = [];
end
   



end
%% =======================================================================================