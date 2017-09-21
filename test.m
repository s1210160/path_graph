function test( )
%UNTITLED5 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all

folder = 'experiment/2_2/mov+env/ACDB/';


tt = [0 0 1 0 ;
      1 0 0 0 ;
      0 0 0 1;
      0 1 0 0];
tf = [0.5 0 0.5 0 ;
      1 0 0 0;
      0 0 0.5 0.5;
      0 0.5 0.5 0];
ft = [0 1 0 0;
      0 0 0 1;
      1 0 0 0;
      0 0 1 0];
ff = [0.5 0.5 0 0;
      0.5 0 0 0.5;
      0.5 0 0.5 0;
      0 0 1 0];

  
for i=1:size(tt, 1)
    TT(:, :, i) = prob_matrix(tt(i, :));
    TF(:, :, i) = prob_matrix(tf(i, :));
    FT(:, :, i) = prob_matrix(ft(i, :));
    FF(:, :, i) = prob_matrix(ff(i, :));
end

% シミュレーション
for p=0:0.1:1
    
    close all
    
    result = [];
    file_name = strcat(folder, strcat('p=0', num2str(fix(p*10))));
    
    for q = 0:0.1:1

        k = [];

        for trial=1:100000
            [k(trial)] = main2(TT, TF, FT, FF, p, q, trial);
        end
    
        % 結果出力
        figure;
        hold on;
        xlim([0 24]);
        xticks(0:1:24);
        xlabel('\fontsize{15} \it k');
        ylim([0 1]);
        yticks(0:0.1:1);
        ylabel('\fontsize{15} \it P(k)');
        result(fix(q*10)+1, 1:2) = [q result_simulation(q, k)];

        
    end
    
    figure;
    hold on;
    xlim([0 0.5]);
    xticks(0:0.1:0.5);
    xlabel('\fontsize{15} \it p');
    ylim([0 20]);
    yticks(0:5:20);
    ylabel('\fontsize{15} \it Expected value');
    plot(result(:, 1), result(:, 2), 'r*');

    p
    result
    file_output(file_name, result);
end


end

