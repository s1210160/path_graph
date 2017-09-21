function plot_result(  )
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all

folder = '2_2/mov+env/ACDB/';

figure;
hold on;
xlim([0 1]);
xticks(0:0.1:1);
    
for i=1:11
    file_name = strcat(folder, strcat('p=0', strcat(num2str(i-1), '.csv')));

    data(:, i) = csvread(file_name, 0, 1);
    
end

data

figure;
colormap jet;
imagesc([0 1], [0 1], data);
set(gca,'YDir','normal');
colorbar;

saveas(gcf, strcat(folder, 'heatmap_sim.png'));

end

