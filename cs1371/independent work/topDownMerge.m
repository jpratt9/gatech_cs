function sorted = topDownMerge(A, iBegin, iMiddle, iEnd, B)
    i0 = iBegin;
    i1 = iMiddle;
 
    % While there are elements in the left or right runs
    for j = iBegin:iEnd-1
        %If left run head exists and is <= existing right run head.
        if i0 < iMiddle && (i1 >= iEnd || A(i0) <= A(i1) )
            B(j) = A(i0);
            i0 = i0 + 1;
        else
            B(j) = A(i1);
            i1 = i1 + 1;    
        end
    end
    sorted = [A B];
end