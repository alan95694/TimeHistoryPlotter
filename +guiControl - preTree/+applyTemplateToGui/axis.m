function axis(app, itmp, iaxis)

if (nargin == 1)
    itmp    = guiControl.getCurrentTemplateNumber(app);
    iaxis   = guiControl.getCurrentAxisNumber(app);
end

%% bools
app.TightCheckBox.Value         = app.templates{itmp}.axis{iaxis}.b_tight;
app.DontShowAxisCheckBox.Value  = app.templates{itmp}.axis{iaxis}.b_dontShow;
app.logyCheckBox.Value          = app.templates{itmp}.axis{iaxis}.b_logy;

% String
app.LegendTitleEditField.Value      = app.templates{itmp}.axis{iaxis}.str_legendTitle;
app.HorizontalLinesEditField.Value  = app.templates{itmp}.axis{iaxis}.str_horLines;

% Numeric
app.yminEditField.Value     = app.templates{itmp}.axis{iaxis}.num_ymin;
app.ymaxEditField.Value     = app.templates{itmp}.axis{iaxis}.num_ymax;

% pull down
guiControl.applyTemplateToGui.applyTemplateToGuiPullDown( ...
    app.LegendLocationDropDown, app.templates{itmp}.axis{iaxis}.pd_legendLocation);

end