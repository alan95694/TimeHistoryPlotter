function figure(app, itmp)
% 
% 
% 


if (nargin == 1)
    itmp = guiControl.getCurrentTemplateNumber(app);
end

% Inpd Channel
if strcmp(app.templates{itmp}.figure.indpChan, '<null>')
    app.IndependentChannelDropDown.Items = {app.templates{itmp}.figure.indpChan};
else
    guiControl.independentChannel_DropDownOpen(app);
end


%% Other things

% Bools
app.MajorGridCheckBox.Value = app.templates{itmp}.figure.b_majorGrid;
app.MinorGridCheckBox.Value = app.templates{itmp}.figure.b_minorGrid;

% Strings
app.sgtitleEditField.Value = app.templates{itmp}.figure.str_sgtitle;

% Pull down
app.TileSpaceDropDown.Value = app.templates{itmp}.figure.pd_TileSpace;


end