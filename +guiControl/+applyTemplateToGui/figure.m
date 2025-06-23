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
    error('do something here')
end

%% Other things

% Bools
app.MajorGridCheckBox.Value = app.templates{itmp}.figure.b_majorGrid;



end