function [avgHigh, avgLow] = avgTemp(temps)
%Returns the average high and low temperatures (AVGHIGH and AVGLOW) given a
%cell array of temperatures TEMPS with associated high and low strings for
%each element
highs = temps(strcmp(temps,'High'),:); %masks temps by rows who have 'high' in them
highs = [highs{:,2}]; %creates a vector containing all high temps
avgHigh = round(sum(highs)/length(highs)); %finds the average value of this vect

lows = temps(strcmp(temps,'Low'),:); %masks temps by rows who have 'low' in them
lows = [lows{:,2}]; %creates a vector containing all low temps
avgLow = round(sum(lows)/length(lows)); %finds the average value of this vect
end