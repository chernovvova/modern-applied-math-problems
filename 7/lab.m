ruleList = [];

for temp = 1:5
    for hum = 1:5
        for wind = 1:5
            for pres = 1:5

                comfort = 3;
                
                if temp == 1 || temp == 5
                    comfort = 1;
                elseif temp == 2 || temp == 4
                    comfort = 2;
                end
                
                if hum == 1 || hum == 5
                    comfort = min(comfort+1, 3);
                elseif hum == 2 || hum == 4
                    comfort = min(comfort+1, 4);
                end
                
                if wind == 4 || wind == 5
                    comfort = max(comfort-1,1);
                elseif wind == 1
                    comfort = min(comfort+1,5);
                end
                
                if pres == 1 || pres == 5
                    comfort = max(comfort-1,1);
                elseif pres == 2 || pres == 4
                    comfort = comfort;
                end
                
                ruleList = [ruleList; temp hum wind pres comfort 1 1];
            end
        end
    end
end

fis = addRule(fis, ruleList);

ruleedit(fis);