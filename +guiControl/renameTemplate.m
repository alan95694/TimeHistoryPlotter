function renameTemplate(app, strNewName)
% 
% 
% 

%% Save all
itmp    = guiControl.getCurrentTemplateNumber(app); 
iaxis   = guiControl.getCurrentAxisNumber(app); 
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app); 
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);

%% Prompt where to enter new name
if isempty(strNewName)
    uiconfirm(app.TimeHistoryPlotterUIFigure, ...
        "Enter new name in Command Window", "Use Command Window", ...
        "Icon","info", ...
        "options", "Ok");
    
    itmp = guiControl.getCurrentTemplateNumber(app); 
    PROMPT = sprintf('Enter new name for template "%s": ', app.templates{itmp}.name);
    
    RESULT = input(PROMPT, 's');
    
    if isempty(RESULT)
        uiconfirm(app.TimeHistoryPlotterUIFigure, ...
            "Template names cant be empty", "Bad input.", ...
            "Icon","error", ...
            "options", "Ok");
    
        return
    end
else
    RESULT = strNewName;
end

%% Ensure new name is unique
if any(contains(app.PlottingTemplatesListBox.Items, RESULT))
    disp('Rename to make unique.')
    RESULT = [RESULT, ' '];
    % Add number to make unique
    nn = 1;
    while (true)
        strNewName = [RESULT, num2str(nn)];
        if ~any(contains(app.PlottingTemplatesListBox.Items, strNewName))
            break
        end
        nn = nn + 1;
    end
    RESULT = strNewName;
end


%% Apply new name
app.templates{itmp}.name = RESULT;

app.PlottingTemplatesListBox.Items{itmp} = RESULT;
app.PlottingTemplatesListBox.Value = RESULT;

end
%% =======================================================================================
