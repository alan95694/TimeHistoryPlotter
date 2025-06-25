function axis(app, itmp, iaxis, newName)
% 
% 
% 

app.templates{itmp}.axis{iaxis}.name    = newName;

% bool
app.templates{itmp}.axis{iaxis}.b_tight = false;


% pull down
app.templates{itmp}.axis{iaxis}.pd_legendLocation = "northeast";


end