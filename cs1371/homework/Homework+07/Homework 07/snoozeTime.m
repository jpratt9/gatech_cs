function snoozes = snoozeTime(sleepTime, alarmTime, snoozeLength, classTime)
%Returns the number of times you can snooze given the length of those
%snoozes, the time you went to sleep, when your alarm went off, and when
%your first class starts
snoozes = 0;
%breaks down times into component minutes/hours
[sleepHour, sleepMinute] = strtok(sleepTime,':');
[alarmHour, alarmMinute] = strtok(alarmTime,':');
[classHour, classMinute] = strtok(classTime,':');

%turns times into single numbers representing minutes since midnight
sleepTime = str2double(sleepHour)*60 + str2double(sleepMinute(2:end));
alarmTime = str2double(alarmHour)*60 + str2double(alarmMinute(2:end));
classTime = str2double(classHour)*60 + str2double(classMinute(2:end));

timeSlept = alarmTime - sleepTime; %amount of time timeSlept without snoozes
if timeSlept >= 8*60 || (classTime - alarmTime) <=20 %8 hours of sleep or 20min til class means no snoozing
    snoozes = 0;
else %otherwise, the amount of snoozes depends on timeSlept being less than 8 hours and waking up 20min before class
    %you can sleep over 8 hours, as long as before you started
    %snoozing again you were under 8 hours, but you must wake up at least
    %20 minutes before class ends
    while timeSlept < 8*60 && sleepTime + timeSlept + snoozeLength + 20 <= classTime
        snoozes = snoozes + 1;
        timeSlept = timeSlept + snoozeLength;
    end
end
end