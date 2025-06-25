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

% strings


% pull down
app.templates{itmp}.axis{iaxis}.line{iline}.pd_color    = app.ColorDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth = app.LineWidthDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker   = app.MarkerDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_style    = app.StyleDropDown.Value;

end
