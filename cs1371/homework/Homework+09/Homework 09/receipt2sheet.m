function [] = receipt2sheet(textFile)
% Creates an xls file listing properties of items to be bought given a
% TEXTFILE representing a receipt
fh = fopen(textFile,'r'); %opens receipt text file
line = '';
receiptArray = {'Item' 'Quantity' 'Unit Price' 'Total Price'}; %headers for xls file
while ischar(line)
    line = fgetl(fh); %reads line of text file
    if ischar(line) %makes sure the -1 at the end of the file isn't read
        lineArray = strsplit(line); %creates array of individual words of line
        while ~strcmp(lineArray(2),'-') %line 11-14 combine all words before the first '-' into one string
           lineArray{1} = [lineArray{1} ' ' lineArray{2}];
           lineArray(2) = [];
        end
        quant = [lineArray{3} ' ' lineArray{4}]; %converts unit and value into single string
        price = str2double(lineArray{6}(2:end)); %converts price into double
        unitPrice = str2double(sprintf('%.2f',price/str2double(lineArray{3}))); %creates unit price and rounds it to nearest cent
        lineArray = {lineArray{1}, quant, unitPrice, price}; %creates cell array of appropriate line elements
        receiptArray = vertcat(receiptArray, lineArray); %appends lineArray to bottom of current receiptArray
    end
end
xlswrite([textFile(1:end-4) 'Sheet.xls'], receiptArray); %writes receiptArray onto excel file
fclose(fh); %closes text file
end