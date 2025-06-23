function plottingTemplates(app)
% 
% 
% 

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
curList{1} = app.templates{itmp}.axis{iaxis}.line{1}.name;
for ii = 2:length(app.templates{itmp}.axis{iaxis}.line)
    curList{ii} = app.templates{itmp}.axis{iaxis}.line{ii}.name;
end
app.CurrentAxisListBox.Items = curList;

% Update "Figure Properties"
guiControl.applyTemplateToGui.figure(app, itmp);

% Update "Axis Properties"
guiControl.applyTemplateToGui.axis(app, itmp, iaxis);

% Update "Line Properties"
guiControl.applyTemplateToGui.line(app, itmp, iaxis, 1);


end