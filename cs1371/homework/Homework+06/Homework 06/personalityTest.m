function [ dom, rec, wings ] = personalityTest( type, pVec, subType )
%PERSONALITYTEST Determines the dominant (DOM), recessive (REC), and wings
%(WINGS) personality types of a person given an inputted personality type
%(TYPE), list of personality types (PVEC), and personality subtype
%(SUBTYPE)

%if the inputted TYPE started with a lowercase letter, TYPE is REC, and if
%TYPE started with an uppercase letter, TYPE is DOM

%if upper(type(1)) == type(1)
    type = lower(type);
    type(1) = upper(type(1));
    domLoc = 0;
    dom = '';
    rest = pVec;
    while(~strcmp(dom,type))
        [dom, rest] = strtok(rest,' ');
        domLoc = domLoc + 1;
    end
    rest = pVec;
    recLoc = mod(domLoc + 5, 10);
    for n = 1:recLoc
        [rec, rest] = strtok(rest, ' ');
    end
%{
elseif lower(type(1)) == type(1)
    type = lower(type);
    type(1) = upper(type(1));
    recLoc = 0;
    rec = '';
    rest = pVec;
    while(~strcmp(rec,type))
        [rec, rest] = strtok(rest,' ');
        recLoc = recLoc + 1;
    end
    rest = pVec;
    domLoc = mod(recLoc + 5, 10);
    for n = 1:domLoc
        [dom, rest] = strtok(rest, ' ');
    end
end
    %}
%finds and records the leftwing and rightwing personality types given the
%location of DOM (DOMLOC)
leftLoc = mod(domLoc+1,10);
rightLoc = mod(domLoc-1,10);
if domLoc == 1
    rightLoc = 10;
end
leftWing = '';
rightWing = '';
rest = pVec;
for n = 1:leftLoc
        [leftWing, rest] = strtok(rest, ' ');
end
rest = pVec;
for n = 1:rightLoc
        [rightWing, rest] = strtok(rest, ' ');
end
%appends the subtype indicator given by SUBTYPE to DOM, and creates a
%string combining LEFTWING and RIGHTWING
wings = [leftWing ' ' rightWing];
dom = [dom '_' subType(1)];
end

