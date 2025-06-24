function addCurChannelToCurrentAxis(app)
% 
% 
% 






%% Add new line into axis 
itmp    = guiControl.getCurrentTemplateNumber(app);
iaxis   = guiControl.getCurrentAxisNumber(app);

if isequal(app.CurrentAxisListBox.Value, '<null>')
    iline = 1; % overwrite default
else
    % Save Line Properties to template
    ilineLast = guiControl.getCurrentDataChannelinCurrentAxisNumber(app);
    guiControl.saveGuiToTemplate.line(app, itmp, iaxis, ilineLast);
    iline = 1 + ilineLast;
end

% Make new unique name
strRootName = app.DataChannelsListBox.Value;
if any(contains(app.CurrentAxisListBox.Items, strRootName))
    nn = 1;
    while (true)
        strTestNewName = [strRootName, '<rep ', num2str(nn), '>'];
        if ~any(contains(app.CurrentAxisListBox.Items, strTestNewName))
            break
        end
        nn = nn + 1;
    end

else
    strTestNewName = strRootName;
end

guiControl.setDefaults.line(app, itmp, iaxis, iline, strTestNewName);


% Update list box 
curList{1} = app.templates{itmp}.axis{iaxis}.line{1}.name;
for ii = 2:length(app.templates{itmp}.axis{iaxis}.line)
    curList{ii} = app.templates{itmp}.axis{iaxis}.line{ii}.name;
end
app.CurrentAxisListBox.Items = curList;
app.CurrentAxisListBox.Value = strTestNewName;


%% Update "Line Properties"
guiControl.applyTemplateToGui.line(app, itmp, iaxis, iline);


end
%% =======================================================================================



















