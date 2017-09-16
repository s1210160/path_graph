function test( )
%UNTITLED5 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all
    
% シミュレーション

for p=0.9:0.1:1
    
    close all
    
    result = [];
    file_name = strcat('experiment/2_2/mov+env/ABDC/p=0', num2str(fix(p*10)));
    
    for q = 0:0.1:1
    
        % 確率行列
        %{
        G = [0 1-p 0 p 0 0;
             p 0 1-2*p 0 p 0;
             0 p 0 0 0 1-p;
             1-p 0 0 0 p 0
             0 p 0 1-2*p 0 p
             0 0 p 0 1-p 0];
        %}

        Gp = [0 1-p p 0
             p 0 0 1-p
             1-p 0 0 p
             0 p 1-p 0];
        Gq = [0 1-q q 0
             q 0 0 1-q
             q 0 0 1-q
             0 1-q q 0];


        k = [];
        t = zeros(size(Gp, 1));

        for i=1:size(Gp, 1)
            Mov(:, :, i) = prob_matrix(Gp(i, :));
            Env(:, :, i) = prob_matrix(Gq(i, :));
        end

        for trial=1:1000000
            %[k(trial)] = main1(Mov, trial);
            [k(trial)] = main2(Mov, Env, trial);
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
        %result_calc(p)
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

    result
    file_output(file_name, result);

    result
    t
end


end

