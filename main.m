function [k] = main(p)
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
now_cell = [1 1];
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
        if pre_path(i) ==  cells(now_cell(1), now_cell(2))
            next = pre_path(mod(i,4)+1);
            break;
        end
    end
    
    
    % �O���ɂ���Ď��O�o�H����O�ꂽ
    if r < p
        if cells(now_cell(1), mod(now_cell(2), 2)+1) ~= next
            now_cell = [now_cell(1), mod(now_cell(2), 2)+1];
        else
            now_cell = [mod(now_cell(1), 2)+1, now_cell(2)];
        end
    % ���O�o�H�ǂ���ɐi��
    else
        if cells(now_cell(1), mod(now_cell(2), 2)+1) == next
            now_cell = [now_cell(1), mod(now_cell(2), 2)+1];
        else
            now_cell = [mod(now_cell(1), 2)+1, now_cell(2)];
        end
    end
    
    
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == cells(now_cell(1), now_cell(2))
            un_visit(:, i) = [];
            break;
        end
    end
end
end

