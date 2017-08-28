function [ valid ] = isValidDate( date )
%ISVALIDDATE Checks to see if an inputted date string (DATE) depicts a
%valid date (VALID)
[month, rest] = strtok(date,' '); 
[date, rest] = strtok(rest,' ,.');
year = strtok(rest, ' ,.'); % removes the space before the year
date = str2num(date); % convert our date and year strings to numbers
year = str2num(year);
valid = date>0; % date can't be valid in the first place if the day of month was negative
if valid && floor(year) ~= year || year < 1 %date is only valid if year is a positive integer
    valid = false;
end
if valid
    switch month %only months spelled in the following ways are valid
        case {'January','February','March','April','May','June','July','August','September','October','November','December'}
            valid = true;
        otherwise
            valid = false;
    end
end

if valid %the day of month cannot be greater than the number of days in a given month
    switch month
        case {'January','March','May','July','August','October','December'}
            valid = date<32;
        case {'April','June','September','November'}
            valid = date<31;
    end
end
%checks to see if the year was a leap year
leap = mod(year,400) == 0 || (mod(year,400) ~= 0 && mod(year,4)  == 0 && mod(year,100) ~= 0);
if valid && strcmp(month,'February') %if the month was february, leap year conditions must be checked
    valid = (leap && date<30) || (~leap && date<29);
end
end