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

[Si, Se] = truncateStructFields(app.tHData.(...
    matlab.lang.makeValidName(curName)), 15);

clc, 
disp(' ')
fprintf('Top of data file: "%s"\n', curName)
disp(' ')
disp(struct2table(Si))

disp(' ')
fprintf('End of data file: "%s"\n', curName)
disp(' ')
disp(struct2table(Se))


end
%% =======================================================================================
function [Si, Se] = truncateStructFields(S, n)
    fields = fieldnames(S);

    ll  = length(S.(fields{1}));
    ni  = 1:min(n, ll);
    ne  = max(1, ll-n):ll;

    for i = 1:numel(fields)
        Si.(fields{i}) = S.(fields{i})(ni);
    end
    for i = 1:numel(fields)
        Se.(fields{i}) = S.(fields{i})(ne);
    end
end