function [costume, leftOver] = costumeParty(items, budget)
tempBudget = budget;
[minimum, ndx] = min([items{:,2}]);
costume = '';
if minimum <= budget
    tempBudget = tempBudget - minimum;
    items(ndx,:) = [];
    costumeParty(items,tempBudget);
else
    leftOver = tempBudget;
end
leftOver = tempBudget;
end