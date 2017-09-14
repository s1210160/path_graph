function [ path ] = replan_path( G, now, un_visit )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述

test = [];
path = [];

G(:, now) = 0;

for i=1:size(G, 1)
    if G(now, i) ~= 0
        test = [test; i]
    end
end

for i=1:size(test, 1)
    A = G;
    array = un_visit;
    while true
        % 終了条件
        if size(array, 2) == 0
            break;
        end
        
        A(:, test(i, 1)) = 0;
    end
end


end

