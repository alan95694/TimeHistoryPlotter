function deleteTemplate(app)
% 
% 
% 



% Get selected template
[itmp] = guiControl.getNodeLocation(app, app.TmpTree.SelectedNodes);
if isempty(itmp)
    return
end

%% Delete template data and tree node
delete( app.templates{itmp}.hNode )
app.templates(itmp) = [];

if isempty(app.templates)
    guiControl.makeNewTemplate(app);
end



end
%% =======================================================================================











