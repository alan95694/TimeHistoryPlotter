function [itmp, iax, iline] = getNodeLocation(app, hNode)
% 
%
% 


itmp    = nan;
iax     = nan;
iline   = nan;

if isempty(hNode)
    return
end


switch hNode.NodeData.type
    case {'tmp'}
        itmp = find_itmp(app, hNode);
        return
    case {'axis'}
        itmp = find_itmp(app, hNode.Parent);
        iax  = find_iax(app, hNode, itmp);
        return
    case {'line'}
        itmp    = find_itmp(app, hNode.Parent.Parent);
        iax     = find_iax(app, hNode.Parent, itmp);
        iline   = find_iline(app, hNode, itmp, iax);
        return
end


end
%% =======================================================================================
function itmp = find_itmp(app, hNode)

for itmp = 1:length(app.templates)
    if isequal(hNode, app.templates{itmp}.hNode)
        return
    end
end

end
%% =======================================================================================
function iax = find_iax(app, hNode, itmp)

for iax = 1:length(app.templates{itmp}.axis)
    if isequal(hNode, app.templates{itmp}.axis{iax}.hNode)
        return
    end
end

end
%% =======================================================================================
function iax = find_iline(app, hNode, itmp, iax)

for iline = 1:length(app.templates{itmp}.axis{iax}.line)
    if isequal(hNode, app.templates{itmp}.axis{iax}.line{iline}.hNode)
        return
    end
end

end
%% =======================================================================================


















