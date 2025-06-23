function iAxChn = getCurrentTemplateNumber(app)
% 
% 
% 


iAxChn = find(strcmp( ...
    app.CurrentAxisListBox.Items, ...
    app.CurrentAxisListBox.Value) );




end