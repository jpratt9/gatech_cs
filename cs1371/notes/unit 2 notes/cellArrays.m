clear
clc

{'rain makes me sleepy' true 'zzzz'};
ca = {[1 2 3], 'Jane Smith', false, 28, '555-7863', 'Just do it!'};

first = ca(1) %what we used before the access elements in an array
class(first)  %here it just returns the class of said element


inside = ca{1}

ca(end:-1:1)
ca(end:-1:1)
%{ } means cell at said position, ( ) means class of element at position
%ca(100) %out of bounds cell - same rules as with vectors

%ca(3) = false %%error because false is not a class

ca{3} = false %works to change value

ca(4) = {27} %works - need curly bracket on one side - the { } around 27 makes it a cell

%we can nest cells  watch out for this and only use it if needed.
ca{5} = {'hello'} %be careful about this.  make sure ou really want to put a cell in position 5, not a string


%indexing within a cell that has a compound type
t1 = ca{5}(1) %gets the 1st thing which is a cell itself
t2 = ca{5}{1} %get's what's inside that cell
t3 = ca{1}(1)

ca = [ca pi]   %this will apend a new element that is still a cell but has a double inside of it
ca = [ca {pi}] %does the same thing as above
ca = [ca {{pi}}] %now we;re adding a nested cell


%task is to find the sum of all the doubles in our cell array
%we can't assume everything will be 'addable' so we need to test the type
%and see if it is a double first
total = 0;
for ndx = 1:length(ca)
    prop = ca{ndx}; %get what's actually there
    type = class(prop);
    fprintf('The class in cell #%d is %s\n',type);
    if strcmp(type,'double') %test if we have a double
        total = total + prop;
    end
end
fprintf('The total is %d\n',total);
