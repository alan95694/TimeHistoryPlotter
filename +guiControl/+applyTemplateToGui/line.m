function line(app, itmp, iaxis, iline)

if (nargin == 1)
    itmp    = guiControl.getCurrentTemplateNumber(app);
    iaxis   = guiControl.getCurrentAxisNumber(app);
    iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
end


%% Bools
app.MaxCheckBox.Value = app.templates{itmp}.axis{iaxis}.line{iline}.b_max;
app.MinCheckBox.Value = app.templates{itmp}.axis{iaxis}.line{iline}.b_min;

app.DontShowLineCheckBox.Value      = app.templates{itmp}.axis{iaxis}.line{iline}.b_dontShow;
app.yyaxisRightLineCheckBox.Value   = app.templates{itmp}.axis{iaxis}.line{iline}.b_yyaxisRight;
app.IntegrateLineCheckBox.Value     = app.templates{itmp}.axis{iaxis}.line{iline}.b_integrate;
app.DifferentiateLineCheckBox.Value = app.templates{itmp}.axis{iaxis}.line{iline}.b_differentiate;
app.BiastoZeroLineCheckBox.Value    = app.templates{itmp}.axis{iaxis}.line{iline}.b_biasToZero;
app.InflectionPointsLineCheckBox.Value  = app.templates{itmp}.axis{iaxis}.line{iline}.b_inflectionPoints;

% strings


% pull down
app.ColorDropDown.Value     = app.templates{itmp}.axis{iaxis}.line{iline}.pd_color;
app.LineWidthDropDown.Value = app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth;
app.MarkerDropDown.Value    = app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker;
app.StyleDropDown.Value     = app.templates{itmp}.axis{iaxis}.line{iline}.pd_style;

end
%% =======================================================================================