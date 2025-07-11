function [bMissingData] = plotFigure(template, tHData, hWindow, strDataFileName)
% 
% 
% 

bMissingData = false;

%% Gather things
if ~isfield(tHData, template.figure.indpChan)
    uialert(hWindow, 'Independent channel (time) not found.', 'Error');
    return    
end

%% Work on time channel that has string date format stuffs.
if ~isempty(template.figure.str_dateTimeFormat)
    % "aapl_history" date fomat MMM d yyyy
    time = datetime(tHData.(template.figure.indpChan), ...
                'InputFormat', template.figure.str_dateTimeFormat);
else
    time = tHData.(template.figure.indpChan);
end

if template.figure.b_BiasTimeToZero
    time = time - time(1);
end

fn = fieldnames(tHData);
nVertLines = str2num(template.figure.str_verticalLines);

%% Setup figure
switch template.figure.dd_figure
    case ("gcf")
        hFig = gcf; 
        figure(hFig); % Force into windows focus
    case ("figure")
        hFig = figure; 
    otherwise   
        tmp = strrep(template.figure.dd_figure, "figure(", "");
        tmp = str2double(strrep(tmp, ")", ""));
        hFig = figure(tmp);
end

clf('reset')
reset(hFig); 
drawnow

% Figure size & location
if strcmp(template.figure.dd_figureSize, 'Maximize')
    hFig = figure;
    hFig.WindowState = 'maximized';
elseif strcmp(template.figure.dd_figureSize, 'Dont change')

else
    tmp         = extractBefore(template.figure.dd_figureSize, '-');
    newSize     = str2num(tmp);
    oldPos      = hFig.Position;
    top         = oldPos(2) + oldPos(4);
    newBottom   = top - newSize(2);    
    hFig.Position = [oldPos(1), newBottom, newSize(1), newSize(2)];
end

% Subplot spacing
switch template.figure.dd_TileSpace
    case {"loose"}
        tiledlayout("vertical",... % new in v23a
            "TileSpacing","loose", ...
            "Padding","loose");
    case {"compact"}
        tiledlayout("vertical",...
            "TileSpacing","compact", ...
            "Padding","compact");
    case {"tight"}
        tiledlayout("vertical",...
            "TileSpacing","tight", ...
            "Padding","tight");
    case {"none"}
        tiledlayout("vertical",...
            "TileSpacing","none", ...
            "Padding","tight"); % no none option
end

% Title of figure window
setFigName = ['Data file name: "', strDataFileName, '", plotted with "', template.name, '"'];
set(hFig, 'name', setFigName);

%% Do plotting
hTile = [];
for iax = 1:length(template.axis)

    if (template.axis{iax}.b_dontShow)
        continue
    end

    % Find any left & right plotting
    hasRightPlotting    = false;
    for iline = 1:length(template.axis{iax}.line)
        if (template.axis{iax}.line{iline}.b_yyaxisRight && ~template.axis{iax}.line{iline}.b_dontShow)
            hasRightPlotting = true;
        end
    end

    hTile(iax) = nexttile;
    hold on

    % --- Plot current axis ---
    hLeg    = [];
    strLeg  = [];
    for iline = 1:length(template.axis{iax}.line)

        if (template.axis{iax}.line{iline}.b_dontShow)
            continue
        end
    
        if (hasRightPlotting)
            yyaxis left
        end
        if (template.axis{iax}.line{iline}.b_yyaxisRight)
            yyaxis right
            % Resets automatic color specification, can force with gca -> 'ColorOrder'
            %  but has complexities with manual color specification.  
        end

        strDepName = plotting.getDepName(fn, template.axis{iax}.line{iline}.name);
        if isempty(strDepName)
            % Name not in data set
            fprintf('"%s" not found in data set. \n', template.axis{iax}.line{iline}.name);
            bMissingData = true;
            continue
        end

        depData     = tHData.(strDepName);
        depData_0   = depData;

        % --- Do math on data --- 
        try
            [depData, strLegTxt] = plotting.doMathOnOneLine(time, depData, template.axis{iax}.line{iline} );
        catch
            uialert(hWindow, ...
                {'Error while doing math.'; ...
                sprintf('Issue on channel "%s" in axis "%s"', strDepName, template.axis{iax}.name)}, ...
                'error', ...
                "Icon","error");
            continue
        end

        % --- Plot data --- 
        [hLeg(end+1), strLeg{end+1}] = plotting.plotOneLine(time, depData, ...
                        template.axis{iax}.line{iline} );
        strLeg{end} = [strLeg{end}, strLegTxt];

        % Not finite
        if (template.axis{iax}.line{iline}.b_notFinite)
            iNonFinite = ~isfinite(depData_0);
            xline(time(iNonFinite), 'LineWidth', 1.1);
        end

    end
    if (hasRightPlotting)
        yyaxis left
    end

    % --- Figure level settings ---
    if (template.figure.b_majorGrid)
        grid on
    end
    if (template.figure.b_minorGrid)
        grid minor
    end
    if (iax < length(template.axis))
        % Remove XTickLabel
        switch template.figure.dd_TileSpace
            case {"none", "tight", "compact"}
                set(hTile(end), 'XTickLabel', []);
            otherwise
        end
    end
    if ~isempty(nVertLines)
        xline(nVertLines, 'LineWidth', 1.1);
    end
    if (template.figure.b_logx)
        set(hTile(iax), 'XScale', 'log');
    end

    
    % --- Axis settings ---
    if (template.axis{iax}.b_tight)
        axis tight
    end
    if (template.axis{iax}.b_logy)
        set(hTile(iax), 'YScale', 'log');
    end
    if ~isempty(template.axis{iax}.str_horLines)
        nHorLines = str2num(template.axis{iax}.str_horLines);
        yline(nHorLines, 'LineWidth', 1.1);
    end
    dy = ylim;
    if ~isinf(template.axis{iax}.num_ymin)
        dy(1) = template.axis{iax}.num_ymin;        
    end
    if ~isinf(template.axis{iax}.num_ymax)
        dy(2) = template.axis{iax}.num_ymax;        
    end
    if ~isequal(ylim, dy)
        try ylim(dy)
        catch, warning('Invalid ylim specified.'), end
    end


    % --- Legends and x/y labels --- 
    if ~isempty(hLeg) && ~strcmp(template.axis{iax}.dd_legendLocation, 'none')
        hLeg = legend(hLeg, strLeg, 'Interpreter', 'none', ...
            'location', template.axis{iax}.dd_legendLocation, ...
            'fontsize', 9);
        if ~isempty(template.axis{iax}.str_legendTitle)
            title(hLeg, template.axis{iax}.str_legendTitle, ...
                'Interpreter', template.figure.dd_textInterp);
        end
    end
    if (template.axis{iax}.b_AxisNameYLabel)
        ylabel(template.axis{iax}.name, 'Interpreter', template.figure.dd_textInterp, ...
            'FontSize', 12);
    end
end

%% Post Plotting formatting

strXLabel = sprintf('%s %s', template.figure.indpChan, template.figure.str_postXLabelText);
xlabel(strXLabel, 'Interpreter', template.figure.dd_textInterp, ...
    'FontSize', 12);

% Apply time ranges
dx = xlim;
if (template.figure.num_timeMin >= template.figure.num_timeMax)
    warning('Invalid "Time Min" or "Time Max" - will use default.')
    template.figure.num_timeMin = -inf;
    template.figure.num_timeMax = -inf;
end
if ~isinf(template.figure.num_timeMin)
    dx(1) = template.figure.num_timeMin;
    arrayfun(@(x) xlim(x, dx), hTile);
end
if ~isinf(template.figure.num_timeMax)
    dx(2) = template.figure.num_timeMax;
    arrayfun(@(x) xlim(x, dx), hTile);
end

% Link axes
if (template.figure.b_linkAxes)
    linkaxes(hTile)
end


% template.figure.str_sgtitle           user input
% template.figure.b_fileNameInSgtitle   bool include data file name "strDataFileName"
% template.figure.b_templateNameInSgt   bool include template name
if isempty(template.figure.str_sgtitle) && ~template.figure.b_fileNameInSgtitle && ~template.figure.b_templateNameInSgt
    % No sgtitle
else
    % format
    %   template.figure.str_sgtitle
    %   <file name>, <template name>

    if isempty(template.figure.str_sgtitle)
        foo = {};
    else
        foo = {template.figure.str_sgtitle};
    end

    if template.figure.b_fileNameInSgtitle && ~template.figure.b_templateNameInSgt
        foo{end+1} = strDataFileName;
    elseif ~template.figure.b_fileNameInSgtitle && template.figure.b_templateNameInSgt
        foo{end+1} = template.name;
    elseif template.figure.b_fileNameInSgtitle && template.figure.b_templateNameInSgt
        foo{end+1} = [strDataFileName , ', ', template.name];
    end
    sgtitle(foo, 'Interpreter', template.figure.dd_textInterp);
end


if (template.figure.b_bold)
    % Make all text bold and bigger, lines more think
    plotting.makeBold(hFig);
end


end
%% =======================================================================================























