function teamLeader = teamPowerHolder(conversation)
%Returns the team leader of a group project given a conversation text file.

%while there is no teamLeader and you haven't reached the end of the
%conversation file
%   Scan through the file, saving each line into a set message string until
%   you reach a blank line.
%   Search through that message for the teamPowerHolder phrase
%   if that phrase is in the message
%       that person is the team leader
%       stop reading through the conversation
%   otherwise
%       nothing happens, just go to the next message and repeat the process
%   end
%end

line = '-1';
message = '';
teamLeader = '';

fh = fopen(conversation);

while isempty(teamLeader) && ischar(line)
    while ~isempty(line) %compiles an entire message into one string
        line = fgetl(fh);
        message = [message line];
    end
    if ~isempty(strfind(lower(message),'do you want'))%searches this message string for the phrase of interest
        teamLeader = strtok(message,':');
    end
    line = fgetl(fh); %manually advances to the next line to prevent an infinite loop in the outer while loop
    message = line;
end

fclose(fh); %close the file
end