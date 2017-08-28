clear
clc

john.last = 'doe';
john.first = 'john';
john.single = true;

date.year = 1314;
date.month = 'February';
date.day = 28;
john.birth = date; %deep-copy so john.birth and date ARE NOT POINTERS - they are independent

jane = john; %again, deep copy so jane and john ARE NOT POINTERS - they are independent
jane.first = 'jane'; 

%{
john = rmfield(john,'randomField'); %rmfield returns the edited struct, so we have to set john equal to this edited struct
john.birth = rmField(john.birth,'year');
john.birth
%}

profiles = [john jane];
profiles(1).birth;

john.birth.month = 'mar'; %this won't change profiles(1) because matlab doesn't use pointers
john.birth.day = 1;

profiles(1).birth

class(profiles); %1x2 struct

book1.title = 'Neuromancer';
book1.author = 'William Gibson';
%profiles = [profiles book1] book1 is incompatible - i.e., it has different
%fields

names = fieldnames(profiles) %returns a cell array
class(names{1}) %cell array

for ndx = 1:length(names)
    name = names{ndx}
    value = profiles(1).(name) %need ( ) to have matlab use the string (char) as the field name
    %fprintf('%s\n',name);
end

%does the order of field assignment matter?  we'll add birth before single
%below

joe.last = 'Bloggs';
joe.first = 'Joe';
joe.birth = jane.birth;
joe.single = false;

%ERROR: profles(3) = joe

%profiles = [profiles joe];
%profiles(3)
jane2 = jane;
profiles(3) = jane2; %works because her field order is the same as everyone else in profiles
profiles(4).last = 'Roberts'; %profiles(4) will have empty vectors for all fields but last

for ndx = 1:length(names)
    name = names{ndx}
    value = profiles(1).(name) %need ( ) to have matlab use the string (char) as the field name
    %fprintf('%s\n',name);
end

class(profiles(4).first) %double because it's undefined
class(profiles(1).first) %char because it has been defined
class(profiles(4).single)
class(profiles(1).single)

triplet = struct('last','Matlab','first',{'Adam','Betty','Carole'},'single',{true, false, false},'birth',jane.birth);
profiles = [profiles triplet]