function [k, path] = main2(Mov, Env, seed)
%UNTITLED4 この関数の概要をここに記述
%   詳細説明をここに記述
%
%   不確実性要素が2つのときのパスプランニング
%
%   k: 経路長
%   p: 外乱が起こる確率
%

% セル
%cells = [1 2 3; 4 5 6];
cells = [1 2; 3 4];

% 事前経路
%pre_path = [1 4 5 6 3 2];
pre_path = [1 2 4 3];
% 現在のセル
now_cell = 1;
% 1ステップ前のセル
pre_cell = 1;
% 未訪問セル
un_visit = [2 3 4];

% 経路長
k = 0;
% 経路
path = zeros(size(Mov, 3));
rng(seed,'twister')

while true
    
    if size(un_visit, 2) == 0
        break;
    end
    
    if k > 100000
        break;
    end
    
    r1 = rand;
    r2 = rand;
    
    % 事前経路による次に向かうべきセルを求める
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,size(Mov, 3))+1);
            break;
        end
    end
    
    % 次に進むセル
    now1 = next_cell(Mov(:, :, now_cell), r1);
    now2 = next_cell(Env(:, :, now_cell), r2);
    if now1 ~= now2
        r3 = rand;
        if r3 < 0.5
            now_cell = now1;
        else
            now_cell = now2;
        end
    else
        now_cell = now1;
    end
    
    
    % 未訪問セルの更新
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            %if next == now_cell
                un_visit(:, i) = [];
                break;
        
           %end
        end
    end
    
    
    k = k + 1;
    path(pre_cell, now_cell) = path(pre_cell, now_cell) + 1;
    
    pre_cell = now_cell;
end

end

