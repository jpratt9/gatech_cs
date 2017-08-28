clear
clc

in = fopen('godfather.txt','r'); %open up the file. get the FID, handle for use when readinig
out = fopen('godfatherOut.txt','w'); %open up the file. get the FID, handle for use when readinig
lame = fopen('worstTextEver.junk','r');
%read line
%fgets reads a line from the file and returns it - includes the  new line;
%i.e.\n
%fgetl does a similar thing except it omits the new line
fprintf('in is %d\n', in);
fprintf('lame is %d\n', lame);

keepGoing = true;
count = 0;
while keepGoing
line = fgetl(in); %the file pointer is moved 
if ischar(line)
    count = count + 1;
    fprintf(out,'Line %d: %s\n', count, line); 
else
    keepGoing = false;
end

end

fclose(in);
fclose(out );
