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

%% Setup figure
hFig = figure(1); 
    clf('reset')
    reset(hFig); 
    drawnow

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
for iax = 1:length(template.axis)

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
    
    % --- Axis settings ---
    if (template.axis{iax}.b_tight)
        axis tight
    end


    % --- Legends and x/y labels --- 
    if ~isempty(hLeg)
        legend(hLeg, strLeg, 'Interpreter', 'none', ...
            'location', template.axis{iax}.pd_legendLocation);
    end
    ylabel(template.axis{iax}.name, 'Interpreter', 'none');
    if (iax == length(template.axis))
        xlabel(template.figure.indpChan, 'Interpreter', 'none');
    end
end

%% Post Plotting formatting

sgtitle(template.figure.str_sgtitle)



end
%% =======================================================================================