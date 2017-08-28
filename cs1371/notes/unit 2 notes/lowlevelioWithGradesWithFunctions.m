function lowlevelioWithGradesWithFunctions
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
global total;
global count;

total = 0;  %initialize the operands for the later average calculation
count = 0;  %must be outside the loop to prevent them from being 0 constantly

fgetl(in); %read the column titles of the file since we don't use them in the calculation

keepGoing = true;
while keepGoing
    
    line = fgetl(in); %get a line
    keepGoing = ischar(line);  %make sure it's a real line (i.e. string)
    if keepGoing  %if so
        processLine(line) %do what you need to do w/ the line
    end% end if keepgoing
    
end %end while

average = total/count;
fprintf('The average is: %d\n', round(average));
fclose(in); %close the file

end

function processGrade(token)
global total;
global count;
numToken = str2double(token); %convert '72' to the double 72
if ~isnan(numToken)
    total = total + numToken;  %update total
    count = count + 1;
end
end

function processLine(line)

total = 99;
count = 9;
% "Thompson, Enoch",ME,3697,85,100,100,96,72,95,67,99.00,1991,10,22,2014,5,23
%we'll use a for loop to call strtok since we know exactly how many
%times to call it before we get the 1st test grade; 9 exactly

average = total/count;
fprintf('JUNK AVERAGE: %d\n', round(average));

rest = line;
for x = 1:9
    [val, rest] = strtok(rest, ',');
end

processGrade(val);

%2nd test grade follows the 1st so call strtok once again
[val, rest] = strtok(rest, ',');
processGrade(val);
%3rd test grade follows the 1st so call strtok once again
[val, rest] = strtok(rest, ',');
processGrade(val);
end

