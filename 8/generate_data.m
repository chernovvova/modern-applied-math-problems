x = -2:0.1:2;
y = x.^3;

fileID = fopen('8_1.txt', 'w');
for i = 1:length(x)
    fprintf(fileID, '%.1f %.3f\n', x(i), y(i));
end
fclose(fileID);