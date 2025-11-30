fis = readfis('WeatherComfortSystem_optimized.fis');

idxToDelete = [];
for i = 1:length(fis.Rules)
    rule = fis.Rules(i);
    if rule.Antecedent(1) == 1 || rule.Antecedent(1) == 5
        idxToDelete(end+1) = i;
    end
    if rule.Antecedent(3) == 5
        idxToDelete(end+1) = i;
    end
    if rule.Antecedent(1) == 2 || rule.Antecedent(1) == 4
        idxToDelete(end+1) = i;
    end
    if rule.Antecedent(3) == 4
        idxToDelete(end+1) = i;
    end
end

fis.Rules(idxToDelete) = [];

writeFIS(fis, 'WeatherComfortSystem_optimized.fis');
