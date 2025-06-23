function renameTemplate(app)    
% 
% 
% 

warning('not yet coded')













end
%% =======================================================================================
function showTextInputPopup(app)

% Create popup window
d = uifigure('Name','Enter Text','Modal',true);
d.Position(3:4) = [300 150];  % Width x Height

% Prompt label
uilabel(d, ...
    'Position', [20 100 260 22], ...
    'Text', 'Please enter your name:');

% Text input field
txt = uieditfield(d, 'text', ...
    'Position', [20 70 260 22]);

% OK button
uibutton(d, 'Text', 'OK', ...
    'Position', [100 25 100 30], ...
    'ButtonPushedFcn', @(btn,event) onPopupConfirm(d, txt, app));

end
%% =======================================================================================