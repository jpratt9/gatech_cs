%{
Iteration - effectively repeating blocks of code

while loop:
  
while <conditional_expression>
    <code_block_to_repeat>
end

%}

keepgoing = true;

while keepgoing
    title = input('what movie do you want to see?','s');
  
    switch title
    case{'TD','TST','GoG'}
        time = input('What''s the movie time?\n (1) 11:30am (2) 1:30pm (3) 4:30pm (4) 6:00pm\n');
        switch time
            case {1, 2}
                fprintf('go see it\n');
                keepgoing = false;
            case {3, 4}
                fprintf('go see it, but find another time\n');
            otherwise
                fprintf('%d is not an option\n',time); % will find the first double (d) named 'time'
        end
    case{'D','HFJ','Lucy'}
        fprintf('rent it\n');
        keepgoing = false;
    otherwise
        fprintf('movie is unsupported\n');
    end
end

%{
while false %never executes (duh)
    fprintf('Exam in 1 week!\n');
end
count = 0
while true %infinite loop
    fprintf('%d - Exam in 1 week!\n',count);
    count = count + 1;
end


keepgoing = true;
while keepgoing
   answer = lower(input('Is exam 1 next week? (Y/N)','s'));
   answer = answer(1);
   keepgoing = strcmp(answer,'n');
end
%}