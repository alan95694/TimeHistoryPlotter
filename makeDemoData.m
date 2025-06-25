function makeDemoData
% 
% 
% 


fileName = 'DemoData_03.csv';

tt = [0:0.05:100]';

A = 20.* sin(tt);
B = 12.5.* sin(0.5.*tt);
C = 35.0 .* sin(0.4.*tt) + (30.*rand(numel(tt),1)-15) + 0.5.*tt;
D = 20.* sin(1.*tt) + 5.* sin(0.1.*tt) + (15.*rand(numel(tt),1)-7.5);



figure(1), clf, hold on
    % plot(tt, A)
    % plot(tt, B)
    % plot(tt, C)
    plot(tt, D)
% return


%% Save to file
T = table(tt, A, B, C, D);

writeCsv(T, fileName)


end
%% =======================================================================================
function writeCsv(T, fileName)

% Create a table and assign column names

T.Properties.VariableNames = {'TIME', 'C_1', 'C_2', 'C_3', 'C_4'};

% Write to CSV file
writetable(T, fileName);


end
%% =======================================================================================