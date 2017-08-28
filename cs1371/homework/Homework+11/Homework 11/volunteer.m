function final = volunteer(names)
if length(names) == 1 %if the input cell array was length 1, the final tribute is just the only one present
    final = names{1};
end
if length(names) > 2 %if the array is longer than two, keep chopping off the front until...
    final = volunteer({names{2:end}});
elseif length(names) == 2 %...you get to the last two...
    final = findFinal(names{1},names{2}); %...then reassign final as the correct final from those two
end
final = findFinal(final,names{1}); %finally, compare the final of every element from 2:end of names with the first element
%because of the recursive nature, the function works through everything in
%the cell array but the first entry, then finally addresses the first entry

end

function actualFinal = findFinal(final, potential) %final final tribute of a pair based on first letter of their names

if final(1) < potential(1)
    actualFinal = potential;
else
    actualFinal = final;
end

end