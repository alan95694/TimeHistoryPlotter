function hh = getEditableNodeHandles(hCurNode)
% 
% 
% 


hh.tmp  = [];
hh.ax   = [];
hh.line = [];

if isempty(hCurNode)
    return
end

switch (hCurNode.Tag)
    case {'tmp'}
        if (length(hCurNode.Children) == 1)
            hh.ax   = hCurNode.Children(1); % axis
            if (length(hCurNode.Children.Children) == 1)
                hh.line = hCurNode.Children(1).Children(1); % line
            end
        end
        hh.tmp  = hCurNode; % template
    case {'axis'}
        if (length(hCurNode.Children) == 1)
            hh.line = hCurNode.Children(1); % line
        end
        hh.ax   = hCurNode; % axis
        hh.tmp  = hCurNode.Parent; % template 
    case {'line'}
        hh.line = hCurNode; % line
        hh.ax   = hCurNode.Parent; % axis 
        hh.tmp  = hCurNode.Parent.Parent; % template 
end



end
%% =======================================================================================