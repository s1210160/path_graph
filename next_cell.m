function [ cell ] = next_cell( A, p )
%UNTITLED ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q



for i=1:size(A, 2)
    if p < A(2, i)
        cell = A(1, i);
        break;
    end
end

end

