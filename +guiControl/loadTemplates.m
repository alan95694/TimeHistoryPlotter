function loadTemplates(app)
% 
% 
% 


%% Get filet to load
if (false)
    [fileName, pathName] = uigetfile('*.thpTemplate', ...
        'Select a template file.')
else
    fileName = 'dummyFile.thpTemplate';
    pathName = 'C:\Users\alanc\matlabProjects\HomeProjects_2025\TimeHistoryPlotter\';
end


%% Load file
tmpLoaded = load( fullfile(pathName, fileName), '-mat');
tmpLoaded = tmpLoaded.templates;

%%  Put loaded templates into gui

% ToDo: pull downs, check loaded value is in field

for itmp = 1:length(tmpLoaded)
    
    % Make new default template
    guiControl.makeNewTemplate(app, false);

    % --- Rename template --- 
    strFromFile = ['loaded ', tmpLoaded{itmp}.name];
    % Ensure unique name
    if any(contains(app.PlottingTemplatesListBox.Items, strFromFile))
        strFromFile = [strFromFile, ' '];
        % Add number to make unique
        nn = 1;
        while (true)
            strNewName = [strFromFile, num2str(nn)];
            if ~any(contains(app.PlottingTemplatesListBox.Items, strNewName))
                break
            end
            nn = nn + 1;
        end
        strNewTemplateName = strNewName;
    else
        strNewTemplateName = strFromFile;
    end
    guiControl.renameTemplate(app, strNewTemplateName)

    
    % Apply "figure" properties
    %  Put what was loaded into what was made by default
    for curFd = fieldnames(tmpLoaded{itmp}.figure)'
        app.templates{end}.figure.(curFd{1}) = tmpLoaded{itmp}.figure.(curFd{1});
    end
    
    % Apply loaded axis info
    for iax = 1:length(tmpLoaded{itmp}.axis)
        
        % --- Axis properties --- 
        % Make new one with default properties
        guiControl.setDefaults.axis(app, itmp, iax, tmpLoaded{itmp}.axis{iax}.name);
        
        for curFd = fieldnames(tmpLoaded{itmp}.axis{iax})'
            if strcmp(curFd{1}, 'line')
                continue
            end
            app.templates{end}.axis{iax}.(curFd{1}) = tmpLoaded{itmp}.axis{iax}.(curFd{1});
        end

        % For each line
        for iline = 1:length(tmpLoaded{itmp}.axis{iax}.line)
            
            % Make default line
            guiControl.setDefaults.line(app, itmp, iax, iline, ...
                    tmpLoaded{itmp}.axis{iax}.line{iline}.name);

            for curFd = fieldnames( tmpLoaded{itmp}.axis{iax}.line{iline} )'
                app.templates{end}.axis{iax}.line{iline}.(curFd{1}) = ...
                    tmpLoaded{itmp}.axis{iax}.line{iline}.(curFd{1});
            end
        end        
    end

    % Update what is visible in gui
    guiControl.listBoxSelectedChanged.templates(app, length(app.templates{end}) );

end


end
%% =======================================================================================

































