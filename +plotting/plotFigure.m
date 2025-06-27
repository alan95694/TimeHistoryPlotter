function plotFigure(template, tHData, hWindow, strDataFileName)
% 
% 
% 

%% Gather things
if ~isfield(tHData, template.figure.indpChan)
    uialert(hWindow, 'Independent channel (time) not found.', 'Error');
    return    
end

time = tHData.(template.figure.indpChan);
fn   = fieldnames(tHData);

nVertLines = str2num(template.figure.str_verticalLines);

%% Setup figure
switch template.figure.pd_figure
    case ("gcf")
        hFig = gcf; 
    case ("figure")
        hFig = figure; 
    otherwise   
        tmp = strrep(template.figure.pd_figure, "figure(", "");
        tmp = str2double(strrep(tmp, ")", ""));
        hFig = figure(tmp);
end

clf('reset')
reset(hFig); 
drawnow

% Figure size & location
if ~strcmp(template.figure.pd_figureSize, 'Dont change')
    tmp         = extractBefore(template.figure.pd_figureSize, '-');
    newSize     = str2num(tmp);
    oldPos      = hFig.Position;
    top         = oldPos(2) + oldPos(4);
    newBottom   = top - newSize(2);    
    hFig.Position = [oldPos(1), newBottom, newSize(1), newSize(2)];
end



% subplot spacing
switch template.figure.pd_TileSpace
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
            continue
        end

        % --- Do math on data --- 
        [depData, strLegTxt] = plotting.doMathOnOneLine(time, tHData.(strDepName), template.axis{iax}.line{iline} );

        % --- Plot data --- 
        [hLeg(end+1), strLeg{end+1}] = plotting.plotOneLine(time, depData, ...
                        template.axis{iax}.line{iline} );
        strLeg{end} = [strLeg{end}, strLegTxt];
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
        switch template.figure.pd_TileSpace
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
        try, ylim(dy)
        catch, warning('Invalid ylim specified.'), end
    end


    % --- Legends and x/y labels --- 
    if ~isempty(hLeg)
        hLeg = legend(hLeg, strLeg, 'Interpreter', 'none', ...
            'location', template.axis{iax}.pd_legendLocation);
        if ~isempty(template.axis{iax}.str_legendTitle)
            title(hLeg, template.axis{iax}.str_legendTitle);
        end
    end
    ylabel(template.axis{iax}.name, 'Interpreter', 'none', ...
        'FontSize', 12);
end

%% Post Plotting formatting

strXLabel = sprintf('%s %s', template.figure.indpChan, template.figure.str_postXLabelText);
xlabel(strXLabel, 'Interpreter', 'none', ...
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

if (template.figure.b_fileNameInSgtitle)
    if isempty(template.figure.str_sgtitle)
        foo = {strDataFileName};
    else
        foo = {template.figure.str_sgtitle; strDataFileName};
    end
    sgtitle(foo, 'Interpreter', 'none');
else
    sgtitle(template.figure.str_sgtitle, 'Interpreter', 'none')
end



end
%% =======================================================================================























