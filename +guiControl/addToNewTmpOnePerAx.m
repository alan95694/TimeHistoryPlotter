function addToNewTmpOnePerAx(app)
% 
% 
% 


%% Make new template
tmpNode = guiControl.makeNewTemplate(app);

for curSel = app.DataChannelsListBox.Value

    % Get axis
    if isequal(curSel{1}, app.DataChannelsListBox.Value{1})
        hAxisNode = tmpNode.Children(1);
    else
        hAxisNode = guiControl.makeNewAxis(app);
    end

    % Put channel into axis line
   hAxisNode.Children(1).Text = curSel{1};
end


end
%% =======================================================================================