clear
clc

%reads an excel file and outputs array of doubles (NUM), cell array of
%strings (TXT), and cell array of everything (RAW)
[num, txt, raw] = xlsread('gradeSheet.xls'); 

gradYear = num(:,13); %gets graduation year as a column vector
finals  = num(:,9);
isGraduating = gradYear == 2014 & finals > 60; %mask of gradYear by year=2014

names = txt(3:13,1);
graduates = names(isGraduating); %or equivalently, names(gradYear == 2014)

for ndx = 1:length(graduates)
   fprintf('%s is graduating\n',graduates{ndx}); 
end