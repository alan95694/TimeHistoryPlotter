function strNewName = makeNewUniqueNameListBox(nn, strRootName, cCurNames)
% 
% 
% 


% if ~any(contains(cCurNames, strRootName))
%     strNewName = strRootName;
%     return
% end

% Add number to make unique
while (true)
    strNewName = [strRootName, num2str(nn)];
    if ~any(contains(cCurNames, strNewName))
        break
    end
    nn = nn + 1;
end

end