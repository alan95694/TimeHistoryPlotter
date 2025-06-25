function line(app, itmp, iaxis, iline)
% 
% 
% 



%% Bools
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = app.MaxCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = app.MinCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_dontShow      = app.DontShowLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_yyaxisRight   = app.yyaxisRightLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_integrate     = app.IntegrateLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_differentiate = app.DifferentiateLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_biasToZero    = app.BiastoZeroLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_inflectionPoints  = app.InflectionPointsLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_applySmoothData   = app.ApplySmoothDataLineCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_applyFilter       = app.ApplyFilterLineCheckBox.Value;

% strings
app.templates{itmp}.axis{iaxis}.line{iline}.str_sbWindow    = app.WindowLineEditField.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.str_filterA     = app.FilteraLineEditField.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.str_filterB     = app.FilterbLineEditField.Value;

% pull down
app.templates{itmp}.axis{iaxis}.line{iline}.pd_color        = app.ColorDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth    = app.LineWidthDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker       = app.MarkerDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_style        = app.StyleDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_sdMethod     = app.MethodLineDropDown.Value;


end
