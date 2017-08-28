function newSchedule = phase2Registration(currentSchedule, CRNs, OSCAR)

for i = 1:length(CRNs{2,1}) %
    j = 1;
    while j <= length(OSCAR)
        if OSCAR(j).CRN == CRNs{2,1}(i)
            currentSchedule(end+1) = OSCAR(j);
        end
        j = j + 1;
    end
end

for i = 1:length(CRNs{2,2})
    j = 1;
    while j <= length(currentSchedule)
        if currentSchedule(j).CRN == CRNs{2,2}(i)
            currentSchedule(j) = [];
        end
        j = j + 1;
    end
end

newSchedule = currentSchedule;

end