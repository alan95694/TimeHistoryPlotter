function renameTemplate(app)    
% 
% 
% 

%% Prompt where to enter new name
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

%% Apply new name
app.templates{itmp}.name = RESULT;

app.PlottingTemplatesListBox.Items{itmp} = RESULT;
app.PlottingTemplatesListBox.Value = RESULT;

end
%% =======================================================================================
