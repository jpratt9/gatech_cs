clear
clc

%{
if statement template
if <conditional_expression>
    <code_block>
end
%}

%sample if statement
if true % execute the below if true is true
    wasTrue = true; % code block is between the 'if' and 'end'
    strings;
end

tomatoes = 50;

if tomatoes >= 60
    fresh = true
else
    fresh = false;
end

fprintf('Program finished!\n');
