function [k] = main(M, seed)
%UNTITLED4 この関数の概要をここに記述
%   詳細説明をここに記述
%   k: 経路長
%   p: 外乱が起こる確率
%

% セル
cells = [1 2 3; 4 5 6];

% 事前経路
pre_path = [1 4 5 2 3 6];
% 現在のセル
now_cell = 1;
% 未訪問セル
un_visit = [2 3 4 5 6];

% 経路長
k = 0;

rng(seed, 'twister');

while true
    if size(un_visit, 2) == 0
        break;
    end
    
    k = k + 1;
   
    r = rand;
    
    % 事前経路による次に向かうべきセルを求める
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,size(pre_path, 2))+1);
            break;
        end
    end
    
    % 次に進むセル
    now_cell = next_cell(M(:, :, now_cell), r);
    
    %{
    if next ~= now_cell
        next
        now_cell
        un_visit
        break;
    end
    %}
    
    % 未訪問セルの更新
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            un_visit(:, i) = [];
            break;
        end
    end
end
end

