function sentence = maxDepth(nestedCA)

for i = 1:length(nestedCA)
    if iscell(nestedCA{i})
        maxDepth(nestedCA{i})
    elseif ischar(nestedCA{i})
        depth = ['' nestedCA{i}];
    end
end


%if not nested (contents are not a cell), return 1
%else
%open the cell and recurse

end