function itmp = getCurrentTemplateNumber(app)
% 
% 
% 


itmp = find(strcmp( ...
    app.PlottingTemplatesListBox.Items, ...
    app.PlottingTemplatesListBox.Value) );




end