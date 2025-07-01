function defineMapping(app)
% 
% 
% 

app.mapping = [];

% ----------------------------------------------------------------------------------------
% figure bools
doTheThing(app, 'fig', 'MajorGridCheckBox', 'b_majorGrid',  'bool', true);
doTheThing(app, 'fig', 'MinorGridCheckBox', 'b_minorGrid',  'bool', true);
doTheThing(app, 'fig', 'LinkAxesCheckBox',  'b_linkAxes',   'bool', false);
doTheThing(app, 'fig', 'BoldCheckBox',      'b_bold',       'bool', false);
doTheThing(app, 'fig', 'logxCheckBox',      'b_logx',       'bool', false);
doTheThing(app, 'fig', 'FileNameinsgtitleCheckBox',     'b_fileNameInSgtitle', 'bool', true);
doTheThing(app, 'fig', 'TemplateNameinsgtitleCheckBox', 'b_templateNameInSgt', 'bool', false);
% figure strings
doTheThing(app, 'fig', 'sgtitleEditField',          'str_sgtitle',          'str', '');
doTheThing(app, 'fig', 'VerticalLinesEditField',    'str_verticalLines',    'str', '');
doTheThing(app, 'fig', 'PostxlabeltextEditField',   'str_postXLabelText',   'str', '');
doTheThing(app, 'fig', 'DateTimeFormatEditField',   'str_dateTimeFormat',   'str', '');
% Numbers
doTheThing(app, 'fig', 'TimeMaxEditField',      'num_timeMax', 'num', inf);
doTheThing(app, 'fig', 'TimeMinEditField',      'num_timeMin', 'num', -inf);
% DropDown
doTheThing(app, 'fig', 'TileSpaceDropDown',       'pd_TileSpace',   'dd', 'compact');
doTheThing(app, 'fig', 'FigureNumDropDown',       'pd_figure',      'dd', 'gcf');
doTheThing(app, 'fig', 'FigureSizeDropDown',      'pd_figureSize',  'dd', 'Dont change');
doTheThing(app, 'fig', 'TextInterpreterDropDown', 'pd_textInterp',  'dd', 'none');

% ----------------------------------------------------------------------------------------
% axis bools
doTheThing(app, 'axis', 'TightCheckBox',        'b_tight',      'bool', false);
doTheThing(app, 'axis', 'DontShowAxisCheckBox', 'b_dontShow',   'bool', false);
doTheThing(app, 'axis', 'logyCheckBox',         'b_logy',       'bool', false);

% String
doTheThing(app, 'axis', 'LegendTitleEditField',     'str_legendTitle',  'str', '');
doTheThing(app, 'axis', 'HorizontalLinesEditField', 'str_horLines',     'str', '');

% Numbers
doTheThing(app, 'axis', 'yminEditField', 'num_ymin', 'num', -inf);
doTheThing(app, 'axis', 'ymaxEditField', 'num_ymax', 'num', inf);

% DropDown
doTheThing(app, 'axis', 'LegendLocationDropDown',    'pd_legendLocation',   'dd', 'northeast');

% ----------------------------------------------------------------------------------------
% Line bools
doTheThing(app, 'line', 'MaxCheckBox',                  'b_max',            'bool', false);
doTheThing(app, 'line', 'MinCheckBox',                  'b_min',            'bool', false);
doTheThing(app, 'line', 'DontShowLineCheckBox',         'b_dontShow',       'bool', false);
doTheThing(app, 'line', 'yyaxisRightLineCheckBox',      'b_yyaxisRight',    'bool', false);
doTheThing(app, 'line', 'IntegrateLineCheckBox',        'b_integrate',      'bool', false);
doTheThing(app, 'line', 'DifferentiateLineCheckBox',    'b_differentiate',      'bool', false);
doTheThing(app, 'line', 'BiastoZeroLineCheckBox',       'b_biasToZero',         'bool', false);
doTheThing(app, 'line', 'ApplySmoothDataLineCheckBox',  'b_applySmoothData',    'bool', false);
doTheThing(app, 'line', 'ApplyFilterLineCheckBox',      'b_applyFilter',        'bool', false);

% strings
doTheThing(app, 'line', 'WindowLineEditField',      'str_sbWindow', 'str', '4');
doTheThing(app, 'line', 'FilteraLineEditField',     'str_filterA',  'str', '1');
doTheThing(app, 'line', 'FilterbLineEditField',     'str_filterB',  'str', '0.2 0.2 0.2 0.2 0.2');

% Numbers


% DropDown
doTheThing(app, 'line', 'ColorDropDown',        'pd_color',     'dd', 'automatic');
doTheThing(app, 'line', 'LineWidthDropDown',    'pd_lineWidth', 'dd', '0.5');
doTheThing(app, 'line', 'MarkerDropDown',       'pd_marker',    'dd', 'none');
doTheThing(app, 'line', 'StyleDropDown',        'pd_style',     'dd', '-');
doTheThing(app, 'line', 'MethodLineDropDown',   'pd_sdMethod',  'dd', 'movmean');


end
%% =======================================================================================
function doTheThing(app, figAxLn, guiHand, simpName, type, default)

app.mapping.(figAxLn).(simpName).guiHand = guiHand; % gui handle root name
app.mapping.(figAxLn).(simpName).type    = type;
app.mapping.(figAxLn).(simpName).value   = default;

end
%% =======================================================================================