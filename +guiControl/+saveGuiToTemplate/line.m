function line(app, itmp, iaxis, iline)
% 
% 
% 



%% Bools
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = app.MaxCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = app.MinCheckBox.Value;

% strings


% pull down
app.templates{itmp}.axis{iaxis}.line{iline}.pd_color    = app.ColorDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth = app.LineWidthDropDown.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker   = app.MarkerDropDown.Value;


end
