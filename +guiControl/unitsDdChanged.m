function unitsDdChanged(app)
% 
% 
% 


ii = find(strcmp(app.UnitsConversionDropDown.Items, app.UnitsConversionDropDown.Value));
iInfo = ii - 1; % bias list to account for 'none'

app.UnitsConversionDropDown.Tooltip = app.cUnintsText{iInfo};


end
%% =======================================================================================