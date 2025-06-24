function axis(app, itmp, iaxis)



%% bools
app.templates{itmp}.axis{iaxis}.b_tight = app.TightCheckBox.Value;

% pull down
app.templates{itmp}.axis{iaxis}.pd_legendLocation = app.LegendLocationDropDown.Value;


end