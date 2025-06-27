function independentChannel_DropDownOpen(app)
% 
% 
% 


if isempty(app.tHData)
    return
end

selectedStart = app.IndependentChannelDropDown.Value;


%% Check if current Value is in TH data set
curTHData = app.tHData.(matlab.lang.makeValidName(app.LoadedFilesListBox.Value));

if isfield(curTHData, app.IndependentChannelDropDown.Value)
    % Current selectd value is in data set
    % return
end

%% Guess at new indp channel
fn = fieldnames(curTHData);

firstItem   = fn(1);
rest        = fn(2:end);
hasTime     = contains(rest, 'time', 'IgnoreCase', true);

% Reorder: time-related strings first, then the rest
newList = [firstItem; rest(hasTime); rest(~hasTime)];


%% Update drop down
app.IndependentChannelDropDown.Items = newList;

if any(contains(newList, selectedStart))
    app.IndependentChannelDropDown.Value = selectedStart;
else
    app.IndependentChannelDropDown.Value = newList{1};
end




end
%% =======================================================================================