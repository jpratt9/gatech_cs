function restockCost = inventory(inventoryData,priceData)
%Returns the total cost of restocking and a .txt file detailing items to be
%restocked for a business given data on their current inventory
%(INVENTORYDATA) and prices for each item (PRICEDATA)

%open our three files
%read through the inventory and price data files
%   as you read through, tokenize each line by '#' for inventory and store
%   the first 


%opens two files and creates one:  reading the inventory and price data,
%and writing to the restocking data
restockCost = 0;
fhInvent = fopen(inventoryData,'r');
fhPrices = fopen(priceData,'r');
fhRestock = fopen([strtok(inventoryData,'_') '_restockingData.txt'],'w');

inventoryLine = '';
while ischar(inventoryLine) %line 19-22 are for copying the inventory data into the restocking data file
    inventoryLine = fgets(fhInvent);
    fprintf(fhRestock,'%s',inventoryLine);
end
fclose(fhInvent); %closes the inventory file and reopens it so we can begin scanning it again for actual values
fhInvent = fopen(inventoryData,'r');

fgetl(fhInvent); %skips down to the line in the inventory and price files with actual data
fgetl(fhInvent);
fgetl(fhPrices);
fgetl(fhPrices);

fprintf(fhRestock,'\n\n\nRestocking Data:\n\n'); %writes the title line to the restock file
inventoryLine = '';
priceLine = '';
count = 1;
first = true;

while ischar(inventoryLine) && ischar(priceLine) && count<6
   inventoryLine = fgetl(fhInvent);                                                 % stores the current line in the inventory file
   priceLine = fgetl(fhPrices);                                                     % stores the current line in the prices file
   [restockLine, restInventory] = strtok(inventoryLine,'#');                        % stores the name of the item to be restocked
   [initialInventory, finalInventory] = strtok(restInventory,'#');                  % stores the current amount of item in inventory
   finalInventory = finalInventory(2:end);                                          % stores the desired amount of items from the inventory
   inventoryChange = str2double(finalInventory) - str2double(initialInventory);     % stores the amount of inventory needed to be bought
   [~, priceOfRestock] = strtok(priceLine,'$');                                     % stores the price of the item to be bought
   priceOfRestock = inventoryChange*str2double(priceOfRestock(2:end));              % converts the price from string to double, then multiplies by the amount of items to be bought
   restockLine = [restockLine '#' finalInventory ' #' num2str(inventoryChange)];    % restockline should be the name of item, final amount of item desired, and amount of item to be bought
   
   % adds the restockLine to the restock file
   if ~first
        fprintf(fhRestock,'\n%s',restockLine);
   else
       fprintf(fhRestock,'%s',restockLine);
       first = false;
   end
   restockCost = restockCost + priceOfRestock;                                      % adds the cost of restocking the current item to the final restock cost
   count = count + 1;
end
fclose(fhInvent);
fclose(fhPrices);
fclose(fhRestock);
end