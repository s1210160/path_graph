function [A] = prob_matrix( G )
%UNTITLED6 この関数の概要をここに記述
%   詳細説明をここに記述

A = [];

for i=1:size(G, 2)
    if G(1, i) ~= 0
        A = [A [i; G(1, i)]];
    end
end

A = sortrows(A', 2)';


for i=2:size(A, 2)
    A(2, i) = A(2, i-1) + A(2, i);
end

A = padarray(A,[0 size(G, 2)-size(A, 2)],'post');

end

