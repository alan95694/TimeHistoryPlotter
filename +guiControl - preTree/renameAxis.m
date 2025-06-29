function renameAxis(app)    
% 
% 
% 

%% Save all
itmp    = guiControl.getCurrentTemplateNumber(app); 
iaxis   = guiControl.getCurrentAxisNumber(app); 
iline   = guiControl.getCurrentDataChannelinCurrentAxisNumber(app); 
guiControl.saveGuiToTemplate.all(app, itmp, iaxis, iline);

%% Prompt where to enter new name
uiconfirm(app.TimeHistoryPlotterUIFigure, ...
    "Enter new name in Command Window", "Use Command Window", ...
    "Icon","info", ...
    "options", "Ok");

itmp = guiControl.getCurrentTemplateNumber(app); 
PROMPT = sprintf('Enter new name for axis "%s": ', app.templates{itmp}.axis{iaxis}.name);

RESULT = input(PROMPT, 's');

if isempty(RESULT)
    uiconfirm(app.TimeHistoryPlotterUIFigure, ...
        "Axus names cant be empty", "Bad input.", ...
        "Icon","error", ...
        "options", "Ok");

    return
end

%% Apply new name
app.templates{itmp}.axis{iaxis}.name = RESULT;

app.AxisListListBox.Items{iaxis} = RESULT;
app.AxisListListBox.Value = RESULT;

end
%% =======================================================================================
