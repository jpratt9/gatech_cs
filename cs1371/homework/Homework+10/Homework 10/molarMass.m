function mass = molarMass(formula, ptable)
%Computes the molar mass of a species given by FORMULA with periodic table
%PTABLE
mass = 0;
while ~isempty(formula)
   [element, formula] = strtok(formula,','); %picks individual element
   [element, num] = strtok(element,'1234567890'); %picks out number of element in formula
   if isempty(num) %if there is no number given, it's 1
       num = '1';
   end
   mass = mass + str2double(num) * ptable(strcmp({ptable(:).Symbol},element)).AtomicWeight; 
   %finds the element in ptable and adds the quantity times atomic mass of it to current molar mass
   formula = formula(2:end); %removes beginning comma from formula
end

end