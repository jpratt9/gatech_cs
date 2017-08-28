function sorted = sortByHeader(filename, sortHeader)
%Returns a cell array given by xls file of FILENAME sorted by collumn 
% SORTHEADER as SORTED

%fetch raw data from file
%find collumn number of sortHeader
%sort the cell array by this row
%add the headers back onto the cell array

[~, ~, raw] = xlsread(filename); %fetches all raw data from the file as a cell array
col = find(strcmp(sortHeader,raw(1,:))); %finds the collumn of SORTHEADER

sorted = sortrows(raw(2:end,:),col); %uses the sortrows function to sort raw based on values in col (this works on chars and doubles)
sorted = vertcat(raw(1,:),sorted); %adds the headers back to the sorted cell array
end