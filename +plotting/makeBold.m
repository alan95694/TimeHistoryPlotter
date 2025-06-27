function makeBold(hFig)
% 
% 
% 



hTiles  = hFig.Children;
hAxes   = hTiles.Children;

% Set sgtitle
hTiles.Title.FontSize = hTiles.Title.FontSize + 2;
hTiles.Title.FontWeight = 'bold';

for iax = 1:length(hAxes)

    % Text, xy label & legends
    hAxes(iax).FontSize = hAxes(iax).FontSize + 2;
    hAxes(iax).FontWeight = 'bold';

    % Axis boarders more visible
    hAxes(iax).LineWidth = 1.25;  

    % Plotted lines, constant lines and text
    hSub = findall( hAxes(iax) );
    for iSub = 1:length(hSub)
        if isa(hSub(iSub), 'matlab.graphics.chart.primitive.Line')
            hSub(iSub).LineWidth    = hSub(iSub).LineWidth + 2;
            hSub(iSub).MarkerSize   = hSub(iSub).MarkerSize + 8;
        end
        if isa(hSub(iSub), 'matlab.graphics.chart.decoration.ConstantLine')
            hSub(iSub).LineWidth = hSub(iSub).LineWidth + 1;
        end
        if isa(hSub(iSub), 'matlab.graphics.primitive.Text')
            hSub(iSub).FontWeight = 'bold';
        end
    end

end




end
%% =======================================================================================






























