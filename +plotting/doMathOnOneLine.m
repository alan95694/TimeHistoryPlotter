function [depData, strLegTxt] = doMathOnOneLine(indpData, depData, optLine)
% 
% 
% 

strLegTxt = [];

% Bias start to zero
if (optLine.b_biasToZero)
    depData = depData - depData(1);
    strLegTxt = [strLegTxt, ', bias to zero'];
end

% Integrate
if (optLine.b_integrate)
    depData = cumtrapz(indpData, depData);
    strLegTxt = [strLegTxt, ', integrate'];
end

% Differentiate
if (optLine.b_differentiate)
    depData = gradient(depData, indpData);
    strLegTxt = [strLegTxt, ', differentiate'];
end




end
%% =======================================================================================