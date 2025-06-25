function deleteAxis(app)
% 
% 
% 


itmp    = guiControl.getCurrentTemplateNumber(app); 
iaxis   = guiControl.getCurrentAxisNumber(app); 



if (length(app.templates{itmp}.axis) == 1)
    % Remove current and make a new default axis
    app.templates{itmp}.axis(1) = [];
    app.AxisListListBox.Items   = {};

    % --- Make new default axis ---
    % First axis properties
    guiControl.setDefaults.axis(app, itmp, 1, 'Axis 1');
    
    % Declare first line
    guiControl.setDefaults.line(app, itmp, 1, 1, '<null>');


    guiControl.listBoxSelectedChanged.axis(app, itmp, [], 1);
else
    % Remove current and switch to first axis
    app.templates{itmp}.axis(iaxis) = [];

    app.AxisListListBox.Items(iaxis) = [];
    app.AxisListListBox.Value = app.AxisListListBox.Items{1};

    guiControl.listBoxSelectedChanged.axis(app, itmp, [], 1);
end


end
%% =======================================================================================