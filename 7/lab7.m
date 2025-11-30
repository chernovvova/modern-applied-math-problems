fis = mamfis('Name','WeatherComfortSystem.fis');

fis = addInput(fis, [-25 40], "Name", "Температура");

fis = addMF(fis, "Температура", "linzmf", [-14 -6], "Name", "Очень низкая");
fis = addMF(fis, "Температура", "trapmf", [-15 -5 0 10], "Name", "Низккая");
fis = addMF(fis, "Температура", "trapmf", [5 12 18 25], "Name", "Средняя");
fis = addMF(fis, "Температура", "trapmf", [20 27 32 37], "Name", "Высокая");
fis = addMF(fis, "Температура", "linsmf", [30 35], "Name", "Очень высокая");

fis = addInput(fis, [0 100], "Name", "Влажность");
fis = addMF(fis, "Влажность", "linzmf", [11 24], "Name", "Очень низкая");
fis = addMF(fis, "Влажность", "trapmf", [15 30 40 55], "Name", "Низкая");
fis = addMF(fis, "Влажность", "trapmf", [45 55 65 75], "Name", "Средняя");
fis = addMF(fis, "Влажность", "trapmf", [70 80 90 100], "Name", "Высокая");
fis = addMF(fis, "Влажность", "linsmf", [86 94], "Name", "Очень высокая");

fis = addInput(fis, [0 25], "Name", "Скорость ветра");
fis = addMF(fis, "Скорость ветра", "linzmf", [2 5], "Name", "Очень низкая");
fis = addMF(fis, "Скорость ветра", "trapmf", [3 5 7 10], "Name", "Низкая");
fis = addMF(fis, "Скорость ветра", "trapmf", [8 10 13 15], "Name", "Средняя");
fis = addMF(fis, "Скорость ветра", "trapmf", [13 17 20 23], "Name", "Высокая");
fis = addMF(fis, "Скорость ветра", "linsmf", [20 22], "Name", "Очень высокая");

fis = addInput(fis, [960 1040], "Name", "Давление");
fis = addMF(fis, "Давление", "linzmf", [966 974], "Name", "Очень низкое");
fis = addMF(fis, "Давление", "trapmf", [970 980 990 1000], "Name", "Низкое");
fis = addMF(fis, "Давление", "trapmf", [995 1005 1015 1020], "Name", "Среднее");
fis = addMF(fis, "Давление", "trapmf", [1015 1025 1030 1035], "Name", "Высокое");
fis = addMF(fis, "Давление", "linsmf", [1030 1037], "Name", "Очень высокое");

% fis = addInput(fis, [0 100], "Name", "Облачность");
% fis = addMF(fis, "Облачность", "linzmf", [11 24], "Name", "Очень низкая");
% fis = addMF(fis, "Облачность", "trapmf", [15 30 40 55], "Name", "Низкое");
% fis = addMF(fis, "Облачность", "trapmf", [45 55 65 75], "Name", "Средняя");
% fis = addMF(fis, "Облачность", "trapmf", [70 80 90 100], "Name", "Высокая");
% fis = addMF(fis, "Облачность", "linsmf", [91 99], "Name", "Очень высокая");

fis = addOutput(fis, [0 10], "Name", "Комфорт человека");
fis = addMF(fis, "Комфорт человека", "zmf", [0 2], "Name", "Очень низкий");
fis = addMF(fis, "Комфорт человека", "gaussmf", [1.2 3], "Name", "Низкий");
fis = addMF(fis, "Комфорт человека", "gaussmf", [1.3 5], "Name", "Средний");
fis = addMF(fis, "Комфорт человека", "gaussmf", [1.2 7.2], "Name", "Высокий");
fis = addMF(fis, "Комфорт человека", "smf", [8 10], "Name", "Очень высокий");


figure;
subplot(4,1,1);
plotmf(fis, 'input', 1);
title('Температура');

subplot(4,1,2);
plotmf(fis, 'input', 2);
title('Влажность');

subplot(4,1,3);
plotmf(fis, 'input', 3);
title('Ветер');

subplot(4,1,4);
plotmf(fis, "input", 4);
title('Давление');

% subplot(5,1,5);
% plotmf(fis, "input", 5);
% title('Облачность');

figure;
plotmf(fis, 'output', 1);
title('Комфорт человека');