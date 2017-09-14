function plot_result(  )
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all

path = '2_2/mov+env/p=0';

figure;
hold on;
xlim([0 0.6]);
xticks(0:0.1:0.6);
    
for i=1:5
    i
    file_name = strcat(path, strcat(num2str(i), '.csv'))

    data = csvread(file_name)

    if i == 1
        plot(data(1:5, 1), data(1:5, 2), 'ro');
    end
    if i == 2
        plot(data(1:5, 1), data(1:5, 2), 'go');
    end
    if i == 3
        plot(data(1:5, 1), data(1:5, 2), 'bo');
    end
    if i == 4
        plot(data(1:5, 1), data(1:5, 2), 'co');
    end
    if i == 5
        plot(data(1:5, 1), data(1:5, 2), 'mo');
    end
end

figure;
hold on;
xlim([0 0.6]);
xticks(0:0.1:0.6);
    
for i=1:5
    i
    file_name = strcat(path, strcat(num2str(i), '.csv'))

    data = csvread(file_name)


    plot(i*0.1, data(1, 2), 'ro');
    plot(i*0.1, data(2, 2), 'go');
    plot(i*0.1, data(3, 2), 'bo');
    plot(i*0.1, data(4, 2), 'co');
    plot(i*0.1, data(5, 2), 'mo');
end


end

