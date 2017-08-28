function [ accepted ] = GTadmissions( gpa_sat_act, valedictorian_salutatorian, familyAtGT)
%GTADMISSIONS Returns a logical telling whether or not a student with the
%inputted stats will be accepted to GT
%   A student will be accepted for sure if their GPA is 3.85 or greater,
%   SAT is 2000 or greater, and ACT is 29 or greater, or if they were their
%   high school's valedictorian ;or salutatorian.
numReqsMet = sum(gpa_sat_act >= [3.85 2000 29]);
cond1 = numReqsMet == 3 || valedictorian_salutatorian;
%   Otherwise, they must have met two of the minimum grade/test score
%   requirements AND have a family member who attends/attended Tech
cond2 = numReqsMet >= 2 && familyAtGT;
accepted = cond1 || cond2;
end

