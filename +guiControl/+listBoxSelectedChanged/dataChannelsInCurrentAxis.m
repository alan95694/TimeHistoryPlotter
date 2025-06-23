function dataChannelsInCurrentAxis(app, ilineLast)
% 
% 
% 


itmp    = guiControl.getCurrentTemplateNumber(app);
iaxis   = guiControl.getCurrentAxisNumber(app);
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);

%% Save gui state to template
guiControl.saveGuiToTemplate.line(app, itmp, iaxis, ilineLast);

%% Update gui info from template
guiControl.applyTemplateToGui.line(app, itmp, iaxis, iline);


end