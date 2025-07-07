function [depData, strLegTxt] = doMathOnOneLine(indpData, depData, optLine)
% 
% 
% 

strLegTxt = [];

% Units conversion
if ~strcmp(optLine.dd_units, 'none')
    depData = feval( ['units.', optLine.dd_units], depData);
    strLegTxt   = [strLegTxt, ', ', optLine.dd_units, ' '];
end

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

% Normalize [0, 1]
if (optLine.b_norm01)
    depData = interp1([min(depData), max(depData)], [0 1], depData);
    strLegTxt = [strLegTxt, ', Normalize 0 to 1'];
end

% Normalize [-1, 1]
if (optLine.b_normng11)
    depData = interp1([min(depData), 0, max(depData)], [-1, 0, 1], depData);
    strLegTxt = [strLegTxt, ', Normalize -1 to 1'];
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

% User equation
if ~isempty(optLine.str_UserEq)
    depData = doUserEq(depData, indpData, optLine.str_UserEq);
    strLegTxt = [strLegTxt, ', user equation'];
end


end
%% =======================================================================================
function out = doUserEq(xx, tt, str_UserEq)
% eval uses xx and tt
out = eval(str_UserEq);
end
%% =======================================================================================