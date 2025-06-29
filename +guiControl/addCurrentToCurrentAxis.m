function addCurrentToCurrentAxis(app)
% 
% 
% 


% Get what lines and axes are selected
[mILines] = guiControl.getSelectedLinesIndices(app);

if isempty(mILines)
    warning('No axis selected')
    return
end

% One Axis selected at a time 
if size(mILines,1) > 1
    warning('Only one axis can be selected.')
end


cChanSelected = app.DataChannelsListBox.Value;

itmp    = mILines(1);
iax     = mILines(2);

% Find <null> in current axis
for ii = 1:length(app.templates{itmp}.axis{iax}.line)
    if strcmp(app.templates{itmp}.axis{iax}.line{ii}.name, '<null>')
        app.templates{itmp}.axis{iax}.line{ii}.name = cChanSelected{1};
        app.templates{itmp}.axis{iax}.line{ii}.hNode.Text = cChanSelected{1};
        cChanSelected(1) = [];
    end
    if isempty(cChanSelected)
        return
    end
end

% Make new lines to put lines on
while ~isempty(cChanSelected)
    guiControl.makeNewLine(app);

    app.templates{itmp}.axis{iax}.line{end}.name = cChanSelected{1};
    app.templates{itmp}.axis{iax}.line{end}.hNode.Text = cChanSelected{1};
    cChanSelected(1) = [];

    app.TmpTree.SelectedNodes = app.templates{itmp}.axis{iax}.line{end}.hNode;
end

% expand all axis in template
for ia = 1:length(app.templates{itmp}.axis)
    expand(app.templates{itmp}.axis{iax}.hNode);
end

end
%% =======================================================================================