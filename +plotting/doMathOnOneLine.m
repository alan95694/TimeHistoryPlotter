function [depData, strLegTxt] = doMathOnOneLine(indpData, depData, optLine)
% 
% 
% 

strLegTxt = [];


% Smoothdata
if (optLine.b_applySmoothData)
    depData     = smoothdata(depData, optLine.dd_sdMethod, str2num(optLine.str_sbWindow) );
    strLegTxt   = [strLegTxt, ', ', optLine.dd_sdMethod, '( ', optLine.str_sbWindow, ')'];
end

% Filer
if (optLine.b_applyFilter)
    depData     = filter( str2num(optLine.str_filterB), str2num(optLine.str_filterA), depData );
    
    strA = regexprep(optLine.str_filterA, '\s+', ' ');
    strB = regexprep(optLine.str_filterB, '\s+', ' ');
    strLegTxt   = [strLegTxt, ', filter([', strB, '], [', strA, '])' ];
end

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