function loadDemoData(app)
% 
% 
% 


path = 'C:\Users\alanc\matlabProjects\HomeProjects_2025\TimeHistoryPlotter\demoData';

dataLoader.topLevel(app, fullfile(path, 'DemoData_01.csv'));
dataLoader.topLevel(app, fullfile(path, 'DemoData_02.csv'));
dataLoader.topLevel(app, fullfile(path, 'DemoData_03.csv'));
dataLoader.topLevel(app, fullfile(path, 'ford_escort.csv'));



end
