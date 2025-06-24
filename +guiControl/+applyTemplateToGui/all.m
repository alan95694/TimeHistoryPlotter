function all(app, itmp, iaxis, iline)



% Update "Figure Properties"
guiControl.applyTemplateToGui.figure(app, itmp);

% Update "Axis Properties"
guiControl.applyTemplateToGui.axis(app, itmp, iaxis);

% Update "Line Properties"
guiControl.applyTemplateToGui.line(app, itmp, iaxis, iline);


end