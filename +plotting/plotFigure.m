function plotFigure(template, tHData)
% 
% 
% 

%% Gather things
if ~isfield(tHData, template.figure.indpChan)
    uialert(app.TimeHistoryPlotterUIFigure, 'Independent channel (time) not found.', 'Error');
    return    
end

time = tHData.(template.figure.indpChan);
fn   = fieldnames(tHData);

%% Setup plot
hFig = figure(1); 
    clf('reset')
    reset(hFig); 
    drawnow

tiledlayout("vertical") % new in v23a


%% Do plotting
for iax = 1:length(template.axis)

    nexttile
    hold on

    % --- Plot current axis ---
    hLeg    = [];
    strLeg  = [];
    for iline = 1:length(template.axis{iax}.line)

        strDepName = plotting.getDepName(fn, template.axis{iax}.line{iline}.name);
        if isempty(strDepName)
            % Name not in data set
            continue
        end

        [hLeg(iline), strLeg{iline}] = plotting.plotOneLine(time, tHData.(strDepName), ...
                        template.axis{iax}.line{iline} );
    end

    % --- Figure level settings ---
    if (template.figure.b_majorGrid)
        grid on
    end
    
    % --- Axis settings ---
    if (template.axis{iax}.b_tight)
        axis tight
    end


    % --- Legends and x/y labels --- 
    legend(hLeg, strLeg, 'Interpreter', 'none');
    ylabel(template.axis{iax}.name, 'Interpreter', 'none');
    if (iax == length(template.axis))
        xlabel(template.figure.indpChan, 'Interpreter', 'none');
    end


end


end
%% =======================================================================================