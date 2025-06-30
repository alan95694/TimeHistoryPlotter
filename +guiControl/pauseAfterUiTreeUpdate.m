function pauseAfterUiTreeUpdate(app, varargin)



p = inputParser;

% Optional name-value pairs
addParameter(p, 'secPause', 0.35);
addParameter(p, 'strText', 'ui updating');

% Parse inputs
parse(p, varargin{:});


%% Make a popup then take it away

d = uiprogressdlg(app.TimeHistoryPlotterUIFigure, ...
    'Title', 'UITree Updat',...
    'Message', p.Results.strText);

pause(p.Results.secPause)

% Close dialog box
close(d)

end