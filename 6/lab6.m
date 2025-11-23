fis = mamfis('Name','WeatherComfortSystem');

fis = addInput(fis, [-25 40], "Name", "temperature");

fis = addMF(fis, "temperature", "trapmf", [-25 -25 -15 -5], "Name", "Очень низкая");
fis = addMF(fis, "temperature", "trapmf", [-15 -5 0 10], "Name", "Низккая");
fis = addMF(fis, "temperature", "trapmf", [5 12 18 25], "Name", "Средняя");
fis = addMF(fis, "temperature", "trapmf", [20 27 32 37], "Name", "Высокая");
fis = addMF(fis, "temperature", "trapmf", [30 35 40 40], "Name", "Очень высокая");

fis = addInput(fis, [0 100], "Name", "humidity");

fis = addMF(fis, "humidity", "trapmf", [0 0 10 25], "Name", "Очень низкая");
fis = addMF(fis, "humidity", "trapmf", [15 30 40 55], "Name", "Низкая");
fis = addMF(fis, "humidity", "trapmf", [45 55 65 75], "Name", "Средняя");
fis = addMF(fis, "humidity", "trapmf", [70 80 90 100], "Name", "Высокая");
fis = addMF(fis, "humidity", "trapmf", [85 95 100 100], "Name", "Очень высокая");

fis = addInput(fis, [0 25], "Name", "wind");

fis = addMF(fis, "wind", "trapmf", [0 0 2 5], "Name", "Очень низкая");
fis = addMF(fis, "wind", "trapmf", [3 5 7 10], "Name", "Низкая");
fis = addMF(fis, "wind", "trapmf", [8 10 13 15], "Name", "Средняя");
fis = addMF(fis, "wind", "trapmf", [13 17 20 23], "Name", "Высокая");
fis = addMF(fis, "wind", "trapmf", [20 22 25 25], "Name", "Очень высокая");


fis = addOutput(fis, [0 10], "Name", "comfort_level");
fis = addMF(fis, "comfort_level", "zmf", [0 2], "Name", "very_low");
fis = addMF(fis, "comfort_level", "gaussmf", [1.2 3], "Name", "low");
fis = addMF(fis, "comfort_level", "gaussmf", [1.3 5], "Name", "medium");
fis = addMF(fis, "comfort_level", "gaussmf", [1.2 7.2], "Name", "high");
fis = addMF(fis, "comfort_level", "smf", [8 10], "Name", "very_high");


figure;
subplot(3,1,1);
plotmf(fis, 'input', 1);
title('Температура');

subplot(3,1,2);
plotmf(fis, 'input', 2);
title('Влажность');

subplot(3,1,3);
plotmf(fis, 'input', 3);
title('Ветер');

figure;
plotmf(fis, 'output', 1);
title('Комфорт человека');