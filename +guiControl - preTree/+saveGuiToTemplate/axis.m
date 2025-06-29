function axis(app, itmp, iaxis)



%% bools
app.templates{itmp}.axis{iaxis}.b_tight     = app.TightCheckBox.Value;
app.templates{itmp}.axis{iaxis}.b_dontShow  = app.DontShowAxisCheckBox.Value;
app.templates{itmp}.axis{iaxis}.b_logy      = app.logyCheckBox.Value;

% String
app.templates{itmp}.axis{iaxis}.str_legendTitle = app.LegendTitleEditField.Value;
app.templates{itmp}.axis{iaxis}.str_horLines    = app.HorizontalLinesEditField.Value;

% Numeric
app.templates{itmp}.axis{iaxis}.num_ymin    = app.yminEditField.Value;
app.templates{itmp}.axis{iaxis}.num_ymax    = app.ymaxEditField.Value;

% pull down
app.templates{itmp}.axis{iaxis}.pd_legendLocation = app.LegendLocationDropDown.Value;


end