function [ expected_value ] = result_simulation( p, k )
%UNTITLED2 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

% ���Ғl
expected_value = 0;

for i=1:max(k)
    result(i) = sum(k==i)/size(k, 2);
    expected_value = expected_value + result(i) * (i);
end

plot(1:max(k), result(1:max(k)), 'Marker', '+', 'LineStyle', 'none', 'Color', 'red');

end

