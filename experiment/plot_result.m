function plot_result(  )
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all

path = '2_2/mov/random/p=0';

figure;
hold on;
xlim([0 1]);
xticks(0:0.1:1);
    
for i=1:11
    file_name = strcat(path, strcat(num2str(i-1), '.csv'));

    data = csvread(file_name);

    if i == 1
        plot(data(1:11, 1), data(1:11, 2), 'ro', 'LineWidth', 2);
    end
    if i == 2
        plot(data(1:11, 1), data(1:11, 2), 'go', 'LineWidth', 2);
    end
    if i == 3
        plot(data(1:11, 1), data(1:11, 2), 'bo', 'LineWidth', 2);
    end
    if i == 4
        plot(data(1:11, 1), data(1:11, 2), 'co', 'LineWidth', 2);
    end
    if i == 5
        plot(data(1:11, 1), data(1:11, 2), 'mo', 'LineWidth', 2);
    end
    if i == 6
        plot(data(1:11, 1), data(1:11, 2), 'rx', 'LineWidth', 2);
    end
    if i == 7
        plot(data(1:11, 1), data(1:11, 2), 'gx', 'LineWidth', 2);
    end
    if i == 8
        plot(data(1:11, 1), data(1:11, 2), 'bx', 'LineWidth', 2);
    end
    if i == 9
        plot(data(1:11, 1), data(1:11, 2), 'cx', 'LineWidth', 2);
    end
    if i == 10
        plot(data(1:11, 1), data(1:11, 2), 'mx', 'LineWidth', 2);
    end
    
    if i == 11
        plot(data(1:11, 1), data(1:11, 2), 'bx', 'LineWidth', 2);
    end
    
end

figure;
hold on;
xlim([0 1]);
xticks(0:0.1:1);
    
for i=1:10
    file_name = strcat(path, strcat(num2str(i-1), '.csv'));

    data = csvread(file_name);


    plot((i-1)*0.1, data(1, 2), 'ro', 'LineWidth', 2);
    plot((i-1)*0.1, data(2, 2), 'go', 'LineWidth', 2);
    plot((i-1)*0.1, data(3, 2), 'bo', 'LineWidth', 2);
    plot((i-1)*0.1, data(4, 2), 'co', 'LineWidth', 2);
    plot((i-1)*0.1, data(5, 2), 'mo', 'LineWidth', 2);
    plot((i-1)*0.1, data(6, 2), 'rx', 'LineWidth', 2);
    plot((i-1)*0.1, data(7, 2), 'gx', 'LineWidth', 2);
    plot((i-1)*0.1, data(8, 2), 'bx', 'LineWidth', 2);
    plot((i-1)*0.1, data(9, 2), 'cx', 'LineWidth', 2);
    plot((i-1)*0.1, data(10, 2), 'mx', 'LineWidth', 2);
    plot((i-1)*0.1, data(11, 2), 'bx', 'LineWidth', 2);
end


end

