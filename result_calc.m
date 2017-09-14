function [ expected_value ] = result_calc( p )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述

expected_value = 0;

for i=3:100
    l = fix(i/2);
    if mod(i, 2) == 1
        result(i) = 2^(l-1) * (p^(l+2)*(1-p)^(i-l-2)+p^(i-l-2)*(1-p)^(l+2)) + (2^(l-1)-1)*(p^(l+1)*(1-p)^(i-l-1)+p^(i-l-1)*(1-p)^(l+1));
    else
        result(i) = (2^(l-1)-1) * (p^(l+1)*(1-p)^(l-1)+p^(l-1)*(1-p)^(l+1));
    end

    expected_value = expected_value + result(i) * i;
end


plot(3:24, result(3:24), 'Marker', 'o', 'LineStyle', 'none', 'Color', 'blue');


        
end

