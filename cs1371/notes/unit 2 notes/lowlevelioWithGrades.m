function lowlevelioWithGrades
%{
open file
while there's data
   read line
   parse line - pull data
   analyze data
   update total
   update count
end
print total/count
close file
%}

clear
clc

in = fopen('gradeSheet.csv', 'r');

if in < 0
    error('Problem opening file');
end

total = 0;  %initialize the operands for the later average calculation
count = 0;  %must be outside the loop to prevent them from being 0 constantly

fgetl(in); %read the column titles of the file since we don't use them in the calculation

keepGoing = true;
while keepGoing
    
    line = fgetl(in);
    keepGoing = ischar(line);
    if keepGoing
        processLine(line)
    end% end if keepgoing
    
end %end while

average = total/count;
fprintf('The average is %d\n', round(average));
fclose(in); %close the file

end

function processLine(line)

% "Thompson, Enoch",ME,3697,85,100,100,96,72,95,67,99.00,1991,10,22,2014,5,23
%we'll use a for loop to call strtok since we know exactly how many
%times to call it before we get the 1st test grade; 9 exactly

rest = line;
for x = 1:9
    [val, rest] = strtok(rest, ',');
end
%
%     WOW THIS IS UGLY.
%     WHY?
%
%     LOOK AT ALL THE CODE REPETITION!!!!
%
%     How can we fix this?
%

numToken = str2double(val); %convert '72' to the double 72
if ~isnan(numToken)
    total = total + numToken;  %update total
    count = count + 1;
end
end
%2nd test grade follows the 1st so call strtok once again
[val, rest] = strtok(rest, ',');
numToken = str2double(val); %convert '72' to the double 72
if ~isnan(numToken)
    total = total + numToken;  %update total
    count = count + 1;
end
%3rd test grade follows the 1st so call strtok once again
[val, rest] = strtok(rest, ',');
numToken = str2double(val); %convert '72' to the double 72
if ~isnan(numToken)
    total = total + numToken;  %update total
    count = count + 1;
end
end

function processGrade(token)

numToken = str2double(token); %convert '72' to the double 72
if ~isnan(numToken)
    total = total + numToken;  %update total
    count = count + 1;
end
end

