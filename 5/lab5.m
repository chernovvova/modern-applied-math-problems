expert_count = 5;
terms = {'Холодно', 'Прохладно', 'Умеренно', 'Тепло', 'Жарко'};
temp_labels = {
    '-25°C — -20°C', [-25, -20];
    '-20°C — -15°C', [-20, -15];
    '-15°C — -10°C', [-15, -10];
    '-10°C — -5°C', [-10, -5];
    '-5°C — 0°C', [-5, 0]; 
    '0°C — 5°C', [0, 5]; 
    '5°C — 10°C', [5, 10]; 
    '10°C — 15°C', [10, 15]; 
    '15°C — 20°C', [15, 20]; 
    '20°C — 25°C', [20, 25];
    '25°C — 30°C', [25, 30];
    '30°C — 35°C', [30, 35]; 
    '35°C — 40°C', [35, 40];
 };
temp_values = -25:1:40;

% temp_interval_means = zeros(1, size(temp_labels, 1));
% 
% expert_matrix = [
%     [
%         1	1	1	1	1	1	1	0	0	0	0	0	0;
%         0	0	0	0	0	0	1	1	1	0	0	0	0;
%         0	0	0	0	0	0	0	0	1	1	0	0	0;
%         0	0	0	0	0	0	0	0	0	1	1	0	0;
%         0	0	0	0	0	0	0	0	0	0	0	1	1;
%     ];
%     [
%         1	1	1	1	0	0	0	0	0	0	0	0	0;
%         0	0	0	0	1	1	0	0	0	0	0	0	0;
%         0	0	0	0	0	0	1	1	1	1	0	0	0;
%         0	0	0	0	0	0	0	0	0	1	1	1	0;
%         0	0	0	0	0	0	0	0	0	0	0	0	1;
%     ];
%     [
%         1	1	1	1	0	0	0	0	0	0	0	0	0;
%         0	0	0	0	1	1	1	0	0	0	0	0	0;
%         0	0	0	0	0	0	0	1	0	0	0	0	0;
%         0	0	0	0	0	0	0	0	1	1	0	0	0;
%         0	0	0	0	0	0	0	0	0	0	1	1	1;
%     ];
%     [
%         1	1	1	0	0	0	0	0	0	0	0	0	0;
%         0	0	0	1	1	1	1	0	0	0	0	0	0;
%         0	0	0	0	0	0	0	1	1	1	0	0	0;
%         0	0	0	0	0	0	0	0	1	1	1	0	0;
%         0	0	0	0	0	0	0	0	0	0	0	1	1;
%     ]
%     [
%         1	1	1	1	1	0	0	0	0	0	0	0	0;
%         0	0	0	0	0	1	0	0	0	0	0	0	0;
%         0	0	0	0	0	0	1	1	0	0	0	0	0;
%         0	0	0	0	0	0	0	0	1	1	1	0	0;
%         0	0	0	0	0	0	0	0	0	0	1	1	1;
%     ]
% ];
% 
% count_votes = zeros(size(terms, 2), size(temp_labels, 1));
% for term_number = 1:size(terms, 2)
%     for expert_number = 1:expert_count
%         for label_ind = 1:size(temp_labels, 1)
%             count_votes(term_number, label_ind) = count_votes(term_number, label_ind) + expert_matrix((expert_number - 1) * 5 + term_number, label_ind);
%         end
%     end
% end
% 
% degrees_of_memberships = zeros(length(terms), length(temp_labels));
% for term_number = 1:length(terms) 
%     for label_ind = 1:length(temp_labels)
%         degrees_of_memberships(term_number, label_ind) = count_votes(term_number, label_ind) / expert_count; 
%     end
% end

mf_1 = zmf(temp_values, [-15, 0]);
mf_2 = trapmf(temp_values, [-10, 0, 5, 10]);
mf_3 = trapmf(temp_values, [5, 10, 15, 25]);
mf_4 = trapmf(temp_values, [15, 20, 25, 35]);
mf_5 = smf(temp_values, [25, 35]);

figure
plot(temp_values, mf_1, 'b-', 'LineWidth', 2, 'DisplayName', 'Холодно');
hold on
plot(temp_values, mf_2, 'c-', 'LineWidth', 2, 'DisplayName', 'Прохладно');
plot(temp_values, mf_3, 'y-', 'LineWidth', 2, 'DisplayName', 'Умеренно');
plot(temp_values, mf_4, 'Color', [0.85 0.33 0.1], 'LineWidth', 2, 'DisplayName', 'Тепло');
plot(temp_values, mf_5, 'r-', 'LineWidth', 2, 'DisplayName', 'Жарко');

hold off
