function line(app, itmp, iaxis, iline, newName)
% 
% 
% 


app.templates{itmp}.axis{iaxis}.line{iline}.name = newName;

% bool
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = false;

app.templates{itmp}.axis{iaxis}.line{iline}.b_dontShow      = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_yyaxisRight   = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_integrate     = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_differentiate = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_biasToZero    = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_applySmoothData   = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_applyFilter   = false;

% strings
app.templates{itmp}.axis{iaxis}.line{iline}.str_sbWindow    = "4";
app.templates{itmp}.axis{iaxis}.line{iline}.str_filterA     = "1";
app.templates{itmp}.axis{iaxis}.line{iline}.str_filterB     = "0.2 0.2 0.2 0.2 0.2";


% pull down
app.templates{itmp}.axis{iaxis}.line{iline}.pd_color        = "automatic";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth    = "0.5";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker       = "none";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_style        = "-";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_sdMethod     = "movmean";

end