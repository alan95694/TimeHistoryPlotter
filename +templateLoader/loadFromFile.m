function loadFromFile(app)
% 
% 
% 



%% Get file to load
if (true)
    file = fullfile('C:\Users\alanc\matlabProjects\HomeProjects_2025\TimeHistoryPlotter', 'templateSaveFile.tHPlotter');
else
    % uiget file thing....

end


%% Load file
try
    foo = load(file, "-mat");
    loadedTemplates = foo.templates;
catch
    % error message
end

%% Put content of file into new templates

for iTmp = 1:length(loadedTemplates)

    % Make new template to put loaded template(s) into
    hNewTmp = guiControl.makeNewTemplate(app);

    % Put loaded data into new template
    hNewTmp.Text = loadedTemplates{iTmp}.name;
    app.IndependentChannelDropDown.Items = {loadedTemplates{iTmp}.figure.indpChan};
    loadedTemplates{iTmp}.figure = rmfield(loadedTemplates{iTmp}.figure, 'indpChan');

    % Put loaded things into NodeData
    addToNodeData(app, hNewTmp, loadedTemplates{iTmp}.figure);
    % Put NodData into gui
    guiControl.guiTreeNodeCom.treeNodeToGui(app, hNewTmp);

    % Add axies
    for iax = 1:length(loadedTemplates{iTmp}.axis)
        
        if (iax == 1)
            hNewAx = hNewTmp.Children(1); % one axis is automatically made by makeNewTemplate()
        else
            hNewAx = guiControl.makeNewAxis(app);
        end

        hNewAx.Text = loadedTemplates{iTmp}.axis{iax}.name;
        loadedTemplates{iTmp}.axis{iax} = rmfield(loadedTemplates{iTmp}.axis{iax}, 'name');

        % Put loaded things into NodeData
        addToNodeData(app, hNewAx, loadedTemplates{iTmp}.axis{iax});

        % Put NodData into gui
        guiControl.guiTreeNodeCom.treeNodeToGui(app, hNewAx);

        for iline = 1:length(loadedTemplates{iTmp}.axis{iax}.line)
            
            if (iline == 1)
                hNewLine = hNewAx.Children(1); % one line is automatically made by makeNewTemplate()
            else
                hNewLine = guiControl.makeNewLine(app);
            end

            hNewLine.Text = loadedTemplates{iTmp}.axis{iax}.line{iline}.name;
            loadedTemplates{iTmp}.axis{iax}.line{iline} = rmfield(loadedTemplates{iTmp}.axis{iax}.line{iline}, 'name');

            % Put loaded things into NodeData
            addToNodeData(app, hNewLine, loadedTemplates{iTmp}.axis{iax}.line{iline});         

            % Put NodData into gui
            guiControl.guiTreeNodeCom.treeNodeToGui(app, hNewLine);
        end
    end
end


end
%% =======================================================================================
function addToNodeData(app, hNode, myStruct)

for fn = fieldnames(hNode.NodeData)'

    if isfield(myStruct, fn{1})
        if isequal(hNode.NodeData.(fn{1}).type, 'dd')
            % Check Value is in Items
            if any(ismember(app.(hNode.NodeData.(fn{1}).guiHand).Items, myStruct.(fn{1})))
                hNode.NodeData.(fn{1}).Value = myStruct.(fn{1});
                myStruct = rmfield(myStruct, fn{1});
            else
                fprintf('Dropdown content incompatibility - defaulting to first option.\n')
                hNode.NodeData.(fn{1}).Value = app.(hNode.NodeData.(fn{1}).guiHand).Items{1};
                myStruct = rmfield(myStruct, fn{1});
            end
        else
            hNode.NodeData.(fn{1}).Value = myStruct.(fn{1});
            myStruct = rmfield(myStruct, fn{1});
        end
    else

    end
end

% Were in file but not in current template format
for fn = fieldnames(myStruct)'
    if ~isequal(fn{1}, 'line')
        fprintf('"%s" = "%s" was in loaded file but is not currently in app.\n', ...
                fn{1}, myStruct.(fn{1}) )
    end
end

end
%% =======================================================================================



















