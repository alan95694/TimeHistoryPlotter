function line(app, itmp, iaxis, iline, newName)
% 
% 
% 


app.templates{itmp}.axis{iaxis}.line{iline}.name = newName;
app.templates{itmp}.axis{iaxis}.line{iline}.b_min = false;
app.templates{itmp}.axis{iaxis}.line{iline}.b_max = false;




end