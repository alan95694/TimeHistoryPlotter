function deleteTemplate(app)
% 
% 
% 


itmpCur = guiControl.getCurrentTemplateNumber(app); 


if (length(app.templates) == 1)
    % Remove current and make a new default template
    app.templates(1) = [];
    app.PlottingTemplatesListBox.Items = {};

    guiControl.makeNewTemplate(app, true);
else
    % Remove current and switch to first template
    app.templates(itmpCur) = [];

    app.PlottingTemplatesListBox.Items(itmpCur) = [];
    app.PlottingTemplatesListBox.Value = app.PlottingTemplatesListBox.Items{1};

    guiControl.listBoxSelectedChanged.templates(app, []);
end

end
%% =======================================================================================