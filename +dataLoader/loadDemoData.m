function loadDemoData(app)
% 
% 
% 

curFolder   = mfilename('fullpath');
parent      = fileparts(curFolder);
grndParent  = fileparts(parent);

demoDataFolder = fullfile(grndParent, 'demoData');

dataLoader.topLevel(app, fullfile(demoDataFolder, 'DemoData_01.csv'));
dataLoader.topLevel(app, fullfile(demoDataFolder, 'DemoData_02.csv'));
dataLoader.topLevel(app, fullfile(demoDataFolder, 'DemoData_03.csv'));
dataLoader.topLevel(app, fullfile(demoDataFolder, 'ford_escort.csv'));



end
