function makeNewAxis(app)
% 
% 
% 


%% Save gui to template
itmp    = guiControl.getCurrentTemplateNumber(app);
iaxis   = guiControl.getCurrentAxisNumber(app);
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);



%% Get new unique name
nn = iaxis+1;
strRootName = 'Axis ';
while (true)
    strTestNewName = [strRootName, num2str(nn)];
    if ~any(contains(app.AxisListListBox.Items, strTestNewName))
        break
    end
    nn = nn + 1;
end


%% Setup template with defaults
iaxis = length(app.templates{itmp}.axis) + 1;

% axis properties
guiControl.setDefaults.axis(app, itmp, iaxis, strTestNewName);

% Declare first line
guiControl.setDefaults.line(app, itmp, iaxis, 1, '<null>');


%% Update gui
app.AxisListListBox.Items{end+1} = strTestNewName;
app.AxisListListBox.Value  = strTestNewName;

app.CurrentAxisListBox.Value = app.CurrentAxisListBox.Items{1};

% Update Axis Properties and Line Properties gui
iaxisLast = [];
guiControl.listBoxSelectedChanged.axis(app, itmp, iaxisLast, iaxis);


end
%% =======================================================================================



















