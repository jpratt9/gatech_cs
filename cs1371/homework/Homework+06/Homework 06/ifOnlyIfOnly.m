function [ out1, out2 ] = ifOnlyIfOnly( in1, in2 )
%IFONLYIFONLY Outputs OUT1 and OUT2, the result of the values and classes
%of inputted variables IN1 and IN2
if isnumeric(in1) %assignment statements if in1 was a number
    out1  = in1/sum(sum(in2));
    out2 = in1 .* in2;    
elseif ischar(in1) %assignment statements if in1 was a string
    out2 = length(in1) == length(in2);
    if length(in1) > length(in2) 
        in1 = in1(1:length(in2));
    else
        in2 = in2(1:length(in1));
    end
    out1 = [in1 ' ' in2];
elseif islogical(in1) %assignment statements if in1 was a logical
    out1 = ~in1;
    if(isnumeric(in2)) %assignment statements if in2 was a number
        out2 = mod(in2,2) == 0;
    else %assignment statements if in2 was not a number
        cond = mod(str2num(in2),2) == 0;
        if cond
            out2 = 'True';
        else
            out2 = 'False';
        end
    end
end
end