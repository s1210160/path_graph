function [ expected_value ] = result_simulation( p, k )
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

% 期待値
expected_value = 0;

for i=1:max(k)
    result(i) = sum(k==i)/size(k, 2);
    expected_value = expected_value + result(i) * (i);
end

plot(1:max(k), result(1:max(k)), 'Marker', '+', 'LineStyle', 'none', 'Color', 'red');

end

