function updateAxisLineEditable(app, hh)
% 
% 
% 



if ~isempty(hh.ax) || length(hh.tmp.Children) == 1
    app.AxisPropertiesPanel.Enable = true;
else
    app.AxisPropertiesPanel.Enable = false;
end


if (~isempty(hh.line) || length(hh.tmp.Children(1).Children) == 1) && ...
        app.AxisPropertiesPanel.Enable
    app.LinePropertiesPanel.Enable = true;
else
    app.LinePropertiesPanel.Enable = false;
end



end