function copyAxis(app)
% 
% 
% 


%% Save all
itmp    = guiControl.getCurrentTemplateNumber(app); 
iaxis   = guiControl.getCurrentAxisNumber(app); 
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app); 
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);


%% Make new unique name
strOrgName  = [app.templates{itmp}.axis{iaxis}.name, ' copy '];
cCurNames   = app.AxisListListBox.Items;
strNewName  = guiControl.makeNewUniqueNameListBox(1, strOrgName, cCurNames);


%% Copy template
app.templates{itmp}.axis{end+1} = app.templates{itmp}.axis{iaxis};
app.templates{itmp}.axis{end}.name = strNewName;

%% Update gui
app.AxisListListBox.Items{end+1} = strNewName;
app.AxisListListBox.Value = strNewName;


end