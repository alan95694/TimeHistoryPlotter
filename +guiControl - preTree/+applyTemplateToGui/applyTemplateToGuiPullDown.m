function applyTemplateToGuiPullDown(hTgt, inpValue)
% 
% Check that value is member of pull downlist
% 
% Long term issue if tempate is saved and pull down list changes - 
%   will cause crash.
% 

if any(contains(hTgt.Items, inpValue))
    hTgt.Value = inpValue;
else
    % If not found default to first in list
    hTgt.Value = hTgt.Items{1};
end

end