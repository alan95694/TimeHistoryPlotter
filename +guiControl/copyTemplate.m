function copyTemplate(app)
% 
% 
% 


itmp = guiControl.getCurrentTemplateNumber(app); 

%% Make new unique name
strOrgName  = [app.templates{itmp}.name, ' copy '];
cCurNames   = app.PlottingTemplatesListBox.Items;
strNewName  = guiControl.makeNewUniqueNameListBox(1, strOrgName, cCurNames);


%% Copy template
app.templates{end+1} = app.templates{itmp};
app.templates{end}.name = strNewName;

%% Update gui
app.PlottingTemplatesListBox.Items{end+1} = strNewName;
app.PlottingTemplatesListBox.Value = strNewName;


end