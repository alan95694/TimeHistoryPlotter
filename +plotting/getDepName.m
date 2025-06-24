function strOut = getDepName(fn, strCur)
% 
% 
% 


% remove <rep #>
strClean = regexprep(strCur, '<[^>]*>', '');

if any(contains(fn, strClean))
    strOut = strClean;
else
    strOut = [];
end


end
