function line(app, itmp, iaxis, iline)
% 
% 
% 



%% Bools
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = app.MaxCheckBox.Value;
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = app.MinCheckBox.Value;



end
