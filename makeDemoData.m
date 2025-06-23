function makeDemoData
% 
% 
% 


fileName = 'DemoData_02.csv';

tt = [0:0.1:10]';

A = 20.* sin(tt);
B = 12.5.* sin(0.5.*tt);
C = 35.0 .* sin(1.5.*tt) + (5.*rand(numel(tt),1)-2.5);
D = (B > 5 | B < -5) .* 10 ; 



figure(1), clf, hold on
    % plot(tt, A)
    plot(tt, B)
    % plot(tt, C)
    plot(tt, D)



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