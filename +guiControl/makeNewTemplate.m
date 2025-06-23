function makeNewTemplate(app, makeDefault)
% 
% 
% 

%% Get new unique name
if makeDefault
    strTestNewName = 'template_1';
else
    nn = 1;
    strRootName = 'template_';
    while (true)
        strTestNewName = [strRootName, num2str(nn)];
        if ~isfield(app.templates, strTestNewName)
            break
        end
        nn = nn + 1;
    end
end

%% Setup template with defaults

if isempty(app.templates)
    itmp = 1;
else
    itmp = length(app.templates) + 1;
end

% Figure level properties
guiControl.setDefaults.figure(app, itmp);

% First axis properties
guiControl.setDefaults.axis(app, itmp, 1, 'Axis 1');

% Declare first line
guiControl.setDefaults.line(app, itmp, 1, 1, '<null>');


%% Update gui

if isempty(app.PlottingTemplatesListBox.Items{1})
    app.PlottingTemplatesListBox.Items{1} = strTestNewName;
else
    app.PlottingTemplatesListBox.Items{end+1} = strTestNewName;
end

% Update "Axis List"
guiControl.listBoxSelectedChanged.plottingTemplates(app);







end
%% =======================================================================================



















