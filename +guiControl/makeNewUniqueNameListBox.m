function strNewName = makeNewUniqueNameListBox(nn, strRootName, cCurNames)


while (true)
    strNewName = [strRootName, num2str(nn)];
    if ~any(contains(cCurNames, strNewName))
        break
    end
    nn = nn + 1;
end

end