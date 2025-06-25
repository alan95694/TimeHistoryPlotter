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

% Figure size
if ~strcmp(template.figure.pd_figureSize, 'Dont change')
    % To do, update so upper left does not move.
    tmp = extractBefore(template.figure.pd_figureSize, '-');
    tmp = str2num(tmp);
    pos = hFig.Position;
    hFig.Position = [pos(1), pos(2), tmp];
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

    hTile(iax) = nexttile;
    hold on

    % --- Plot current axis ---
    hLeg    = [];
    strLeg  = [];
    for iline = 1:length(template.axis{iax}.line)

        strDepName = plotting.getDepName(fn, template.axis{iax}.line{iline}.name);
        if isempty(strDepName)
            % Name not in data set
            disp(sprintf('"%s" not found in data set', template.axis{iax}.line{iline}.name));
            continue
        end

        [hLeg(iline), strLeg{iline}] = plotting.plotOneLine(time, tHData.(strDepName), ...
                        template.axis{iax}.line{iline} );
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























