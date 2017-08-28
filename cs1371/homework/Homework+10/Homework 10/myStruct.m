function struct = myStruct(cell)
%Converts a cell into a struct

struct.(cell{1}) = cell{2}{1};  %initializes the struct
valslength = length([cell{2}]); %defines the size of the struct array
while ~isempty(cell)            %lines 6-18 create the struct array
   for i = 1:length(cell{2})    %run though cell{2} and store each value into struct
       struct(i).(cell{1}) = cell{2}(i);
   end
   if length(cell{2})<valslength    %if cell{2} was a 1x1 cell,
       for i = 2:valslength         %make every value in the struct of field name cell{1} into cell{2}'s value
            struct(i).(cell{1}) = cell{2}(1);
       end
   end
   
   cell(1) = []; %remove the first field name and values from cell
   cell(1) = [];
end
end