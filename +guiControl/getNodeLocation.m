function [hh] = getNodeLocation(app, hNode)
% 
%
% 



hh.tmp  = [];
hh.ax   = [];
hh.line = [];

if isempty(hNode) || ~isvalid(hNode)
    return
end

switch hNode.Tag
    case {'tmp'}
        hh.tmp  = hNode;
        return
    case {'axis'}
        hh.tmp  = hNode.Parent;
        hh.ax   = hNode;
        return
    case {'line'}
        hh.tmp  = hNode.Parent.Parent;
        hh.ax   = hNode.Parent;
        hh.line = hNode;
        return
end


end
%% =======================================================================================


















