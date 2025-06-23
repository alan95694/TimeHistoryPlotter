function axis(app, itmp, iaxis, newName)
% 
% 
% 

app.templates{itmp}.axis{iaxis}.name    = newName;
app.templates{itmp}.axis{iaxis}.b_tight = false;


end