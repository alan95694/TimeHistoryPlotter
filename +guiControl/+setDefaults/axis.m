function axis(app, itmp, iaxis, newName)
% 
% 
% 

app.templates{itmp}.axis{iaxis}.name    = newName;

% bool
app.templates{itmp}.axis{iaxis}.b_tight     = false;
app.templates{itmp}.axis{iaxis}.b_dontShow  = false;
app.templates{itmp}.axis{iaxis}.b_logy      = false;

% String
app.templates{itmp}.axis{iaxis}.str_legendTitle = '';
app.templates{itmp}.axis{iaxis}.str_horLines    = '';

% Numeric
app.templates{itmp}.axis{iaxis}.num_ymin = -inf;
app.templates{itmp}.axis{iaxis}.num_ymax = +inf;


% pull down
app.templates{itmp}.axis{iaxis}.pd_legendLocation = "northeast";


end