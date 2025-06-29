function deleteLine(app)
% 
% 
% 


%% Save all
itmp    = guiControl.getCurrentTemplateNumber(app); 
iaxis   = guiControl.getCurrentAxisNumber(app); 
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app); 
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);


if (length(app.templates{itmp}.axis{iaxis}.line) == 1)
    app.templates{itmp}.axis{iaxis}.line(1) = [];
    app.CurrentAxisListBox.Items = {};
    
    % Declare first line
    guiControl.setDefaults.line(app, itmp, iaxis, 1, '<null>');

    %% Update gui info from template
    app.CurrentAxisListBox.Items = {app.templates{itmp}.axis{iaxis}.line{1}.name};
    app.CurrentAxisListBox.Value = app.CurrentAxisListBox.Items{1};
    guiControl.applyTemplateToGui.line(app, itmp, iaxis, 1);    

else
    
    app.templates{itmp}.axis{iaxis}.line(iline) = [];

    app.CurrentAxisListBox.Items(iline) = [];
    app.CurrentAxisListBox.Value = app.CurrentAxisListBox.Items{1};

    %% Update gui info from template
    guiControl.applyTemplateToGui.line(app, itmp, iaxis, 1);
end







end
%% =======================================================================================