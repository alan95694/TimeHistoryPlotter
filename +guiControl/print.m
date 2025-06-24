function print(templates)
% 
% 
% 

clc
pause(0.25)

for ii = 1:length(templates)

    str = sprintf('template{ %d }, "%s"', ii, templates{ii}.name);
    disp(str);

    for jj = 1:length(templates{ii}.axis)
    
        str = sprintf('\t axis: "%s"', templates{ii}.axis{jj}.name);
        disp(str);

        for kk = 1:length(templates{ii}.axis{jj}.line)
            
            str = sprintf('\t\t line: "%s"', templates{ii}.axis{jj}.line{kk}.name);
            disp(str);

        end

    end

    disp(' ')

end


end
%% =======================================================================================