fis = readfis('WeatherComfortSystem_improved.fis');

% Температура | Влажность | Скорость ветра | Давление
testCases = [
    -20   20   1    970
    -10   90   10   995
     35   85   5    1010
     35   30   2    1020
     10   10   20   1035

     20   50   3    1015
     18   55   5    1010
     22   40   6    1005

      5   65   8    1000
     12   80   4     998
     28   20   12   1025
     15   30   15   1018

     30   95   1    974
      0   75   7    1030
      8   15   18   1008
];


fprintf("%3s | %10s | %10s | %10s | %10s | %10s\n", ...
    "#", "Темп", "Влажн.", "Ветер", "Давление", "Комфорт");
fprintf("%s", repmat("-", 1, 70));
fprintf('\n');

for i = 1:size(testCases, 1)
    inputs = testCases(i, :);
    comfort = evalfis(fis, inputs);

    fprintf("%3d | %10.1f | %10.1f | %10.1f | %10.1f | %10.3f\n", ...
        i, inputs(1), inputs(2), inputs(3), inputs(4), comfort);
end
