function [A B C D] = prob_matrix( G )
%UNTITLED6 この関数の概要をここに記述
%   詳細説明をここに記述

A = [];
B = [];
C = [];
D = [];

for i=1:4
    if G(1, i) ~= 0
        A = [A [i; G(1, i)]];
    end
    if G(2, i) ~= 0
        B = [B [i; G(2, i)]];
    end
    if G(3, i) ~= 0
        C = [C [i; G(3, i)]];
    end
    if G(4, i) ~= 0
        D = [D [i; G(4, i)]];
    end 
end

A = sortrows(A', 2)';
B = sortrows(B', 2)';
C = sortrows(C', 2)';
D = sortrows(D', 2)';


for i=2:size(A, 2)
    A(2, i) = A(2, i-1) + A(2, i);
end
for i=2:size(B, 2)
    B(2, i) = B(2, i-1) + B(2, i);
end
for i=2:size(C, 2)
    C(2, i) = C(2, i-1) + C(2, i);
end
for i=2:size(D, 2)
    D(2, i) = D(2, i-1) + D(2, i);
end

end

