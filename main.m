function [k] = main(M)
%UNTITLED4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%   k: �o�H��
%   p: �O�����N����m��
%

% �Z��
cells = [1 2; 3 4];

% ���O�o�H
pre_path = [1 2 4 3];
% ���݂̃Z��
now_cell = 1;
% ���K��Z��
un_visit = [2 3 4];

% �o�H��
k = 0;

while true
    if size(un_visit, 2) == 0
        break;
    end
    
    k = k + 1;
    
    r = rand;
    
    % ���O�o�H�ɂ�鎟�Ɍ������ׂ��Z�������߂�
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,4)+1);
            break;
        end
    end
    
    % ���ɐi�ރZ��
    now_cell = next_cell(M(:, :, now_cell), r);
    
    % ���K��Z���̍X�V
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            un_visit(:, i) = [];
            break;
        end
    end
end
end

