function test( )
%UNTITLED5 この関数の概要をここに記述
%   詳細説明をここに記述

close all
clear all

% シミュレーション

for p = 0.1: 0.1:0.5
    
    k = [];
    result = [];
    simu.expected_value = 0;
    calc.expected_value = 0;
    
    % 確率行列
    G = [0 1-p p 0;
         p 0 0 1-p;
         p 0 0 1-p;
         0 1-p p 0];
    [A B C D] = prob_matrix(G);
    M(:, :, 1) = A;
    M(:, :, 2) = B;
    M(:, :, 3) = C;
    M(:, :, 4) = D;
    
    for trial=1:10000000
        k(trial) = main(M);
    end

    % 結果集計
    for i=3:100
        simu.result(i) = sum(k==i)/10000000;
        simu.expected_value = simu.expected_value + simu.result(i) * i;

        l = fix(i/2);
        if mod(i, 2) == 1
            calc.result(i) = 2^(l-1) * (p^(l+2)*(1-p)^(i-l-2)+p^(i-l-2)*(1-p)^(l+2)) + (2^(l-1)-1)*(p^(l+1)*(1-p)^(i-l-1)+p^(i-l-1)*(1-p)^(l+1));
        else
            calc.result(i) = (2^(l-1)-1) * (p^(l+1)*(1-p)^(l-1)+p^(l-1)*(1-p)^(l+1));
        end
        calc.expected_value = calc.expected_value + calc.result(i) * i;
    end

    % 結果出力
    figure;
    hold on;
    plot(3:24, calc.result(3:24), 'Marker', 'o', 'LineStyle', 'none', 'Color', 'blue');
    plot(3:24, simu.result(3:24), 'Marker', '+', 'LineStyle', 'none', 'Color', 'red');
    xlim([0 24]);
    xticks(0:1:24);
    xlabel('\fontsize{15} \it k');
    ylim([0 1]);
    yticks(0:0.1:1);
    ylabel('\fontsize{15} \it P(k)');

    p
    simu.expected_value
    calc.expected_value
end
end

