function deleteTemplate(app)
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



end
%% =======================================================================================











