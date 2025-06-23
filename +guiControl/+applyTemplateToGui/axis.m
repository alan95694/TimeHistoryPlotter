function axis(app, itmp, iaxis)

if (nargin == 1)
    itmp    = guiControl.getCurrentTemplateNumber(app);
    iaxis   = guiControl.getCurrentAxisNumber(app);
end

%% bools
app.TightCheckBox.Value = app.templates{itmp}.axis{iaxis}.b_tight;



end