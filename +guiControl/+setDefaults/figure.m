function figure(app, itmp)
% 
% 
% 


app.templates{itmp}.figure.indpChan     = '<null>';

% bools
app.templates{itmp}.figure.b_majorGrid  = true;
app.templates{itmp}.figure.b_minorGrid  = true;
app.templates{itmp}.figure.b_linkAxes   = false;
app.templates{itmp}.figure.b_bold       = false;
app.templates{itmp}.figure.b_logx       = false;
app.templates{itmp}.figure.b_fileNameInSgtitle      = true;
app.templates{itmp}.figure.b_templateNameInSgtitle  = false;

% strings
app.templates{itmp}.figure.str_sgtitle          = '';
app.templates{itmp}.figure.str_verticalLines    = '';
app.templates{itmp}.figure.str_postXLabelText   = '';
app.templates{itmp}.figure.str_dateTimeFormat   = '';

% Numbers
app.templates{itmp}.figure.num_timeMax  = inf;
app.templates{itmp}.figure.num_timeMin  = -inf;


% pull down
app.templates{itmp}.figure.pd_TileSpace     = "compact";
app.templates{itmp}.figure.pd_figure        = "gcf";
app.templates{itmp}.figure.pd_figureSize    = "Dont change"; 
app.templates{itmp}.figure.pd_textInterp    = "none"; 

end