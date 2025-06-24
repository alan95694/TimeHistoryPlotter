function figure(app, itmp)
% 
% 
% 


% Inpd Channel
app.templates{itmp}.figure.indpChan = app.IndependentChannelDropDown.Value;

%% Other things

% Bools
app.templates{itmp}.figure.b_majorGrid  = app.MajorGridCheckBox.Value;
app.templates{itmp}.figure.b_minorGrid  = app.MinorGridCheckBox.Value;


% strings
app.templates{itmp}.figure.str_sgtitle = app.sgtitleEditField.Value;

% pull down
app.templates{itmp}.figure.pd_TileSpace = app.TileSpaceDropDown.Value;


end
