function [k] = main(p)
%UNTITLED4 この関数の概要をここに記述
%   詳細説明をここに記述
%   k: 経路長
%   p: 外乱が起こる確率
%

% セル
cells = [1 2; 3 4];

% 事前経路
pre_path = [1 2 4 3];
% 現在のセル
now_cell = [1 1];
% 未訪問セル
un_visit = [2 3 4];

% 経路長
k = 0;

while true
    if size(un_visit, 2) == 0
        break;
    end
    
    k = k + 1;
    
    r = rand;
    
    % 事前経路による次に向かうべきセルを求める
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  cells(now_cell(1), now_cell(2))
            next = pre_path(mod(i,4)+1);
            break;
        end
    end
    
    
    % 外乱によって事前経路から外れた
    if r < p
        if cells(now_cell(1), mod(now_cell(2), 2)+1) ~= next
            now_cell = [now_cell(1), mod(now_cell(2), 2)+1];
        else
            now_cell = [mod(now_cell(1), 2)+1, now_cell(2)];
        end
    % 事前経路どおりに進んだ
    else
        if cells(now_cell(1), mod(now_cell(2), 2)+1) == next
            now_cell = [now_cell(1), mod(now_cell(2), 2)+1];
        else
            now_cell = [mod(now_cell(1), 2)+1, now_cell(2)];
        end
    end
    
    
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == cells(now_cell(1), now_cell(2))
            un_visit(:, i) = [];
            break;
        end
    end
end
end

