function previewData(app)
% 
% 
% 



if isempty(app.LoadedFilesListBox.Items{1})
    % Nothing to look at
    disp('No data loaded.')
    return
end



curName = app.LoadedFilesListBox.Value;


tmpData = truncateStructFields(app.tHData.(curName), 20);

tb = struct2table(tmpData);

clc, 
disp(' ')
fprintf('Top of data file: "%s"\n', curName)
disp(' ')
disp(tb)


end
%% =======================================================================================
function S = truncateStructFields(S, n)
    fields = fieldnames(S);

    n = min(n, length(S.(fields{1})));

    for i = 1:numel(fields)
        S.(fields{i}) = S.(fields{i})(1:n);
    end
end