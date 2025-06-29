function makeNewTemplate(app, makeDefault)
% 
% 
% 



% %% Save gui to template
% itmp    = guiControl.getCurrentTemplateNumber(app);
% iaxis   = guiControl.getCurrentAxisNumber(app);
% iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
% guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);


% New templates name
strTestNewName = 'template';

%% Setup template with defaults

if isempty(app.templates)
    itmp = 1;
    app.templates{itmp}.name = strTestNewName;
else
    itmp = length(app.templates) + 1;
    app.templates{itmp}.name = strTestNewName;
end


% Figure level properties
guiControl.setDefaults.figure(app, itmp);

% First axis properties
guiControl.setDefaults.axis(app, itmp, 1, 'Axis 1');

% Declare first line
guiControl.setDefaults.line(app, itmp, 1, 1, '<null>');


%% Update gui
guiControl.refreshTree(app);

app.TmpTree.SelectedNodes = app.templates{end}.hNode;


% % testing tree things
% app.templates{2}.name = 'template 2';
% guiControl.setDefaults.figure(app, 2);
% guiControl.setDefaults.axis(app, 2, 1, 'Axis 1');
% guiControl.setDefaults.axis(app, 2, 2, 'Axis 2');
% guiControl.setDefaults.axis(app, 2, 3, 'Axis 3');
% 
% guiControl.setDefaults.line(app, 2, 1, 1, '<null> 1');
% guiControl.setDefaults.line(app, 2, 2, 1, '<null> 1');
% guiControl.setDefaults.line(app, 2, 3, 1, '<null> 1');
% 
% guiControl.refreshTree(app);
% 
% 
% app.templates{3}.name = 'template 3';
% guiControl.setDefaults.figure(app, 3);
% guiControl.setDefaults.axis(app, 3, 1, 'Axis 1');
% guiControl.setDefaults.line(app, 3, 1, 1, '<null> 1');
% guiControl.refreshTree(app);


%% Update Gui
% guiControl.listBoxSelectedChanged.templates(app, []);







end
%% =======================================================================================



















