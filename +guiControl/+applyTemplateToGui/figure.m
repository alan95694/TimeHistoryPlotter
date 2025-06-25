function figure(app, itmp)
% 
% 
% 


if (nargin == 1)
    itmp = guiControl.getCurrentTemplateNumber(app);
end

% Inpd Channel
if strcmp(app.templates{itmp}.figure.indpChan, '<null>')
    app.IndependentChannelDropDown.Items = {app.templates{itmp}.figure.indpChan};
else
    guiControl.independentChannel_DropDownOpen(app);
end


%% Other things

% Bools
app.MajorGridCheckBox.Value = app.templates{itmp}.figure.b_majorGrid;
app.MinorGridCheckBox.Value = app.templates{itmp}.figure.b_minorGrid;
app.LinkAxesCheckBox.Value  = app.templates{itmp}.figure.b_linkAxes;
app.BoldCheckBox.Value      = app.templates{itmp}.figure.b_bold;
app.logxCheckBox.Value      = app.templates{itmp}.figure.b_logx;
app.FileNameinsgtitleCheckBox.Value = app.templates{itmp}.figure.b_fileNameInSgtitle;

% Strings
app.sgtitleEditField.Value          = app.templates{itmp}.figure.str_sgtitle;
app.VerticalLinesEditField.Value    = app.templates{itmp}.figure.str_verticalLines;
app.PostxlabeltextEditField.Value   = app.templates{itmp}.figure.str_postXLabelText;

% Numbers
app.TimeMaxEditField.Value  = app.templates{itmp}.figure.num_timeMax;
app.TimeMinEditField.Value  = app.templates{itmp}.figure.num_timeMin;

% Pull down
app.TileSpaceDropDown.Value     = app.templates{itmp}.figure.pd_TileSpace;
app.FigureNumDropDown.Value     = app.templates{itmp}.figure.pd_figure;
app.FigureSizeDropDown.Value    = app.templates{itmp}.figure.pd_figureSize;

end















