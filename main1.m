function [k, path] = main1(M, seed)
%UNTITLED4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%
%   �s�m�����v�f��1�̂Ƃ��̃p�X�v�����j���O
%
%   k: �o�H��
%   p: �O�����N����m��
%

% �Z��
%cells = [1 2 3; 4 5 6];
cells = [1 2; 3 4];

% ���O�o�H
%pre_path = [1 4 5 6 3 2];
pre_path = [1 2 4 3];
% ���݂̃Z��
now_cell = 1;
% 1�X�e�b�v�O�̃Z��
pre_cell = 1;
% ���K��Z��
un_visit = [2 3 4];

% �o�H��
k = 0;
% �o�H
path = zeros(size(M, 3));
rng(seed,'twister')

while true
    
    if size(un_visit, 2) == 0
        break;
    end
    
    if k > 100000
        break;
    end
    
    r = rand;
    
    % ���O�o�H�ɂ�鎟�Ɍ������ׂ��Z�������߂�
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,size(M, 3))+1);
            break;
        end
    end
    
    % ���ɐi�ރZ��
    now_cell = next_cell(M(:, :, now_cell), r);
    
    
    % ���K��Z���̍X�V
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            if next == now_cell
                un_visit(:, i) = [];
                break;
        
           end
        end
    end
    
    
    k = k + 1;
    path(pre_cell, now_cell) = path(pre_cell, now_cell) + 1;
    
    pre_cell = now_cell;
end

end

