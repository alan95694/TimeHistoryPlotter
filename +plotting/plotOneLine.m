function [hLine, strLeg] = plotOneLine(indpData, depData, propLine)
% 
% 
% 


%% Draw the line
hLine   = plot(indpData, depData);
strLeg  = propLine.name; % strDepName;

%% Line properties
% set color
switch propLine.pd_color
    case {'automatic'}
    case {'black'}
        hLine.Color = [0 0 0];
    case {'blue'}
        hLine.Color = [0 0.4470 0.7410];
    case {'orange'}
        hLine.Color = [0.8500 0.3250 0.0980];
    case {'yellow'}
        hLine.Color = [0.9290 0.6940 0.1250];
    case {'purple'}
        hLine.Color = [0.4940 0.1840 0.5560];
    case {'green'}
        hLine.Color = [0.4660 0.6740 0.1880];
    case {'light blue'}
        hLine.Color = [0.3010 0.7450 0.9330];
    case {'red'}
        hLine.Color = [0.6350 0.0780 0.1840];
    case {'magenta'}
        hLine.Color = [1 0 1];
end

hLine.LineWidth = str2double(propLine.pd_lineWidth);

if ~isequal(propLine.pd_marker, "none")
    hLine.Marker = propLine.pd_marker;
end
hLine.LineStyle = propLine.pd_style;

dx = xlim;
dy = ylim;

%% Add things to the line
if (propLine.b_min) % data minimum
    [vMn, iMn] = min(depData);
    plot(indpData(iMn), vMn, ...
        'Marker','.', ...
        'MarkerSize', 15, ...
        'Color', hLine.Color);
    
    text(indpData(iMn) + 0.015*diff(dx), vMn, num2str(vMn, 3), ...
        'Color', hLine.Color);
end

if (propLine.b_max) % data maximum
    [vMx, iMx] = max(depData);
    plot(indpData(iMx), vMx, ...
        'Marker','.', ...
        'MarkerSize', 15, ...
        'Color', hLine.Color);
    
    text(indpData(iMx) + 0.015*diff(dx), vMx, num2str(vMx, 3), ...
        'Color', hLine.Color);
end


end
%% =======================================================================================