function makeNewTemplate(app, makeDefault)
% 
% 
% 

if ~makeDefault
    %% Save gui to template
    itmp    = guiControl.getCurrentTemplateNumber(app);
    iaxis   = guiControl.getCurrentAxisNumber(app);
    iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
    guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);
end


%% Get new unique name
if makeDefault
    strTestNewName = 'template 1';
else
    nn = 1;
    strRootName = 'template ';

    while (true)
        strTestNewName = [strRootName, num2str(nn)];
        if ~any(contains(app.PlottingTemplatesListBox.Items, strTestNewName))
            break
        end
        nn = nn + 1;
    end
end

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

if makeDefault % isempty(app.PlottingTemplatesListBox.Items{1})
    app.PlottingTemplatesListBox.Items{1} = app.templates{itmp}.name;
else
    app.PlottingTemplatesListBox.Items{end+1} = app.templates{itmp}.name;
    app.PlottingTemplatesListBox.Value  = app.templates{itmp}.name;
end


%% Update Gui
guiControl.listBoxSelectedChanged.templates(app, []);







end
%% =======================================================================================



















