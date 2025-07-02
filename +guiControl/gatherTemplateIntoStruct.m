function template = gatherTemplateIntoStruct(app, optDisp)
% 
% 
% 


if (optDisp)
    clc
end
pause(0.1)

templates  = [];
names   = [];

%% Survey all templates
itmp = 1;
for hCurTmp = app.TmpTree.Children'

    names{itmp}             = hCurTmp.Text;
    templates{itmp}.figure  = getValueFromStructure(hCurTmp.NodeData);
    templates{itmp}.name    = hCurTmp.Text;
    templates{itmp}.figure.indpChan = app.IndependentChannelDropDown.Value;
    
    if (optDisp)
        fprintf('template{ %d }, "%s" \n', itmp, templates{itmp}.name);
    end

    iax = 1;
    for curAx = hCurTmp.Children'
        templates{itmp}.axis{iax} = getValueFromStructure(curAx.NodeData);
        templates{itmp}.axis{iax}.name = curAx.Text;

        if (optDisp)
            fprintf('\taxis: "%s" \n', templates{itmp}.axis{iax}.name);
        end

        iline = 1;
        for curLine = curAx.Children'
            templates{itmp}.axis{iax}.line{iline} = getValueFromStructure(curLine.NodeData);
            templates{itmp}.axis{iax}.line{iline}.name = curLine.Text;

            if (optDisp)
                fprintf('\t\tline: "%s" \n', templates{itmp}.axis{iax}.line{iline}.name);
            end
            iline = iline + 1;
        end

        iax = iax + 1;
    end
    itmp = itmp + 1;
end

%% Output selected template
template = [];
itmp = 1;

hh = guiControl.getEditableNodeHandles(app.TmpTree.SelectedNodes);

for hCurTmp = app.TmpTree.Children'
    if isequal(hh.tmp, hCurTmp)
        template = templates{itmp};
        return
    end
    itmp = itmp + 1;
end


end
%% =======================================================================================
function out = getValueFromStructure(inp)

% for fn = fieldnames(inp)'
%     out.(fn{1}) = inp.(fn{1}).value;
% end

out = structfun(@(s) s.value, inp, 'UniformOutput', false);

end
%% =======================================================================================






























