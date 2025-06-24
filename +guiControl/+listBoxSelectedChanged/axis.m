function axis(app, itmp, iaxisLast, iaxisCur)
% 
% 
% 

if isempty(itmp)
    itmp        = guiControl.getCurrentTemplateNumber(app);
    iaxisCur    = guiControl.getCurrentAxisNumber(app);
    iline       = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
end

%% Save gui to template
if ~isempty(iaxisLast)
    iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);

    guiControl.saveGuiToTemplate.axis(app, itmp, iaxisLast);    
    guiControl.saveGuiToTemplate.line(app, itmp, iaxisLast, iline)
end


% Update "Data Channels in Current Axis"
curList{1} = app.templates{itmp}.axis{iaxisCur}.line{1}.name;
for ii = 2:length(app.templates{itmp}.axis{iaxisCur}.line)
    curList{ii} = app.templates{itmp}.axis{iaxisCur}.line{ii}.name;
end
app.CurrentAxisListBox.Items = curList;
app.CurrentAxisListBox.Value = curList{1};

%% Write to gui 
iline = 1;
guiControl.applyTemplateToGui.axis(app, itmp, iaxisCur);
guiControl.applyTemplateToGui.line(app, itmp, iaxisCur, iline)


end