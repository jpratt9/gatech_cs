function sequence = mySequence( numTerms )
    x = zeros(1,numTerms);
    for n = 0:numTerms
        x = [x n];
    end
    
end

