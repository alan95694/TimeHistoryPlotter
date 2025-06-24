function line(app, itmp, iaxis, iline, newName)
% 
% 
% 


app.templates{itmp}.axis{iaxis}.line{iline}.name = newName;

% bool
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = false;

% strings


% pull down
app.templates{itmp}.axis{iaxis}.line{iline}.pd_color        = "automatic";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_lineWidth    = "0.5";
app.templates{itmp}.axis{iaxis}.line{iline}.pd_marker       = "none";



end