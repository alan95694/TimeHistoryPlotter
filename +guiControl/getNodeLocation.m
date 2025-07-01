function [hh, ii] = getNodeLocation(app, hNode)
% 
%
% 


% ii.itmp    = nan;
% ii.iax     = nan;
% ii.iline   = nan;

hh.tmp  = [];
hh.ax   = [];
hh.line = [];

if isempty(hNode) || ~isvalid(hNode)
    return
end

switch hNode.Tag
    case {'tmp'}
        hh.tmp  = hNode;
        % itmp    = find_itmp(app, hNode);
        return
    case {'axis'}
        hh.tmp  = hNode.Parent;
        hh.ax   = hNode;
        % itmp = find_itmp(app, hNode.Parent);
        % iax  = find_iax(app, hNode, itmp);
        return
    case {'line'}
        hh.tmp  = hNode.Parent.Parent;
        hh.ax   = hNode.Parent;
        hh.line = hNode;
        % itmp    = find_itmp(app, hNode.Parent.Parent);
        % iax     = find_iax(app, hNode.Parent, itmp);
        % iline   = find_iline(app, hNode, itmp, iax);
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
function iline = find_iline(app, hNode, itmp, iax)

for iline = 1:length(app.templates{itmp}.axis{iax}.line)
    if isequal(hNode, app.templates{itmp}.axis{iax}.line{iline}.hNode)
        return
    end
end

end
%% =======================================================================================


















