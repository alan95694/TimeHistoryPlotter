function figure(app, itmp)
% 
% 
% 


% Inpd Channel
app.templates{itmp}.figure.indpChan = app.IndependentChannelDropDown.Value;

%% Other things

% Bools
app.templates{itmp}.figure.b_majorGrid  = app.MajorGridCheckBox.Value;
app.templates{itmp}.figure.b_minorGrid  = app.MinorGridCheckBox.Value;
app.templates{itmp}.figure.b_linkAxes   = app.LinkAxesCheckBox.Value;
app.templates{itmp}.figure.b_bold       = app.BoldCheckBox.Value;
app.templates{itmp}.figure.b_logx       = app.logxCheckBox.Value;
app.templates{itmp}.figure.b_fileNameInSgtitle      = app.FileNameinsgtitleCheckBox.Value;
app.templates{itmp}.figure.b_templateNameInSgtitle  = app.TemplateNameinsgtitleCheckBox.Value;

% strings
app.templates{itmp}.figure.str_sgtitle = app.sgtitleEditField.Value;
app.templates{itmp}.figure.str_verticalLines    = app.VerticalLinesEditField.Value;
app.templates{itmp}.figure.str_postXLabelText   = app.PostxlabeltextEditField.Value;
app.templates{itmp}.figure.str_dateTimeFormat   = app.DateTimeFormatEditField.Value;

% Numbers
app.templates{itmp}.figure.num_timeMax  = app.TimeMaxEditField.Value;
app.templates{itmp}.figure.num_timeMin  = app.TimeMinEditField.Value;

% pull down
app.templates{itmp}.figure.pd_TileSpace     = app.TileSpaceDropDown.Value;
app.templates{itmp}.figure.pd_figure        = app.FigureNumDropDown.Value;
app.templates{itmp}.figure.pd_figureSize    = app.FigureSizeDropDown.Value;
app.templates{itmp}.figure.pd_textInterp    = app.TextInterpreterDropDown.Value;

end















