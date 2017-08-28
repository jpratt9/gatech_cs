function song = pickSong(fileName, timeLeft)
%Given a track list (FILENAME) and amount of time (TIMELEFT) returns the
%SONG with the closest track length

% convert time left (X:XX) to time in seconds (X)
% open file
% read through file, turning it into a cell array
% convert each track length (X:XX) to an actual amount of seconds (X)as you
%    go, adding each value to the end of the spot in the cell array
% keep track of which song has the length closest to the required length
%    (use ABSOLUTE value of difference)
% finally, print out appropriate song title
[min, sec] = strtok(timeLeft,':');
timeLeft = str2double(min)*60 + str2double(sec(2:end)); %assumes time left will be less than 10 minutes always

fh = fopen(fileName,'r'); %opens our playlist file with read permission
trackDiff = -1; %makes sure the if statement on line 28 evaluates to true during the first while loop iteration
line = ''; %makes sure the while loop evaluates to true at least once
while ischar(line)
    line = fgetl(fh);
    [~, track] = strtok(line); %removes the leading number from the title
    track = track(2:end); %removes the leading space from the track name
    trackLength = strtok(track(end:-1:1)); %finds the track length substring by reading the entire line backwards and delimiting spaces
    trackLengthStringLength = length(trackLength); %length of the string version of tracklength
    trackLength = trackLength(end:-1:1); %reverses our reversed tracklength back to normal
    [min, sec] = strtok(trackLength,':'); %breaks track length string into minutes and seconds
    trackLength = 60*str2double(min)+str2double(sec(2:end)); %converts tracklength string to a time in seconds
    if abs(trackLength-timeLeft) < trackDiff || trackDiff < 0 %checks whether the track has a time closer to timeLeft
        song = track(1:end - trackLengthStringLength - 3);
        trackDiff = abs(trackLength-timeLeft);
    end
end
fclose(fh);
end