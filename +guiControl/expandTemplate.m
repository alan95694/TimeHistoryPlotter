function expandTemplate(app)
% 
% 
% 

vItmp = guiControl.getSelectedTemplateIndices(app);
if isempty(vItmp)
    return
end

for itmp = 1:length(vItmp)
    for iax = 1:length(app.templates{itmp}.axis)
        expand( app.templates{itmp}.axis{iax}.hNode ); 
    end
end

end
%% =======================================================================================