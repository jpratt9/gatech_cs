function [] = unsubscribe(currentMailingList, unsubscribeList)
%Creates two text files:  an updated mailing list given CURRENTMAILINGLIST and
%UNSBUSCRIBELIST text files; a text file of messages to be sent to each
%person who unsubscribed from the mailing list given UNSUBSCRIBELIST

organization = currentMailingList(1:strfind(currentMailingList,' Mailing List.txt')-1);
fhCurrent  = fopen(currentMailingList,'r');
fhUnsub    = fopen(unsubscribeList,'r');
fhUpdated  = fopen([currentMailingList(1:end-4) '_updated.txt'],'w');
fhMessages = fopen(['Unsubscribe from ' organization '_messages.txt'],'w');

currentEmails = {};
unsubbingUsers = {};
unsubbingNames = {}; %cell arrays to hold emails and names
line ='';
while ischar(line) %lines 10-13 run through the entire current mailing list and record each email from it, without ' ,;'
    line = strtok(lower(fgetl(fhCurrent)),' ,;');
    currentEmails = [currentEmails, line];
end
currentEmails = currentEmails(1:end-1); %removes the [-1] element from the end
line = '1';
while ischar(line)
    line = lower(fgetl(fhUnsub)); %reads a line off of the unsub list and lowercases it
    if ~isempty(line) && ischar(line)%if the line isn't empty and is a string:
        [line,rest] = strtok(line(end:-1:1),' ,;'); %removes all trailing ' ,;' and reverses line
        line = [rest(end), line(end:-1:1)]; %appends the first letter of first name (rest(end)) to last name
        unsubbingNames = [unsubbingNames, [upper(rest(end)), rest(end-1:-1:2)]]; %adds the actual first name
        unsubbingUsers = [unsubbingUsers, line]; %re-reverses line and adds it to the unsubscribe list
    end
end
messageStart = ', you have been unsubscribed from the ';
messageEnd = ' mailing list.';
for i = 1:length(unsubbingNames) %creates the text file detailing who was unsubbed
    fprintf(fhMessages,'%s%s%s%s\n', unsubbingNames{i},messageStart,organization,messageEnd); %prints the unsubscribe message to the text file
end

x = 1;
while x <= length(currentEmails) %lines 34-44 search through the current emails and remove all unsubscribed emails
    looking = true;
    y = 1;
    while looking && y<=length(unsubbingUsers)
        if ~isempty(strfind(currentEmails{x},unsubbingUsers{y}))
          currentEmails(x) = [];
        end
        y = y+1;
    end
    x = x + 1;
end

for x = 1:length(currentEmails)
   fprintf(fhUpdated,'%s\n',currentEmails{x});
end

fclose(fhCurrent);
fclose(fhUnsub);
fclose(fhUpdated);
fclose(fhMessages);
end