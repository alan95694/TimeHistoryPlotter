function templates(app, itmpLast)
% 
% 
% 


if ~isempty(itmpLast)
    %% Save gui to template
    iaxis   = guiControl.getCurrentAxisNumber(app);
    iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
    guiControl.saveGuiToTemplate.all(app, itmpLast, iaxis, iline);
end


%% Update gui

itmp = guiControl.getCurrentTemplateNumber(app);

% Update "Axis List"
curList{1} = app.templates{itmp}.axis{1}.name;
for ii = 2:length(app.templates{itmp}.axis)
    curList{ii} = app.templates{itmp}.axis{ii}.name;
end
app.AxisListListBox.Items = curList;
app.AxisListListBox.Value = curList{1};

% Update "Data Channels in Current Axis"
iaxis = 1;
curList = [];
curList{1} = app.templates{itmp}.axis{iaxis}.line{1}.name;
for ii = 2:length(app.templates{itmp}.axis{iaxis}.line)
    curList{ii} = app.templates{itmp}.axis{iaxis}.line{ii}.name;
end
app.CurrentAxisListBox.Items = curList;
app.CurrentAxisListBox.Value = curList{1};

%% update gui
guiControl.applyTemplateToGui.all(app, itmp, 1, 1);


end