function [hLine, strLeg] = plotOneLine(indpData, depData, propLine)
% 
% 
% 


%% Draw the line
hLine   = plot(indpData, depData);
strLeg  = propLine.name; % strDepName;

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