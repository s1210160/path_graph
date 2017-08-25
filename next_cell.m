function [ cell ] = next_cell( A, p )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述



for i=1:size(A, 2)
    if p < A(2, i)
        cell = A(1, i);
        break;
    end
end

end

