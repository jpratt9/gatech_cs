function[candidates, talkingTime] = CFRecruiter(names, GPAs, talks)
%Returns the possible candidates and total time to talk for Career Fair
%Recruiter
candidates = [];
talkingTime = 0;
for i = 1:length(GPAs) %runs this code a number of times equal to the length of GPAs
    [name, names] = strtok(names,',');
    while isspace(name(1)) %removes leading spaces
        name(1) = '';
    end
    if GPAs(i) > 2.5 && talks(i) %only a candidate if GPA>2.5 and they stayed to talk
        candidates = [candidates ', ' name];
        talkingTime = talkingTime + (GPAs(i) - 2.5) * 4;
    end
end
candidates = candidates(3:end);
end