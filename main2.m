function [k] = main2(TT, TF, FT, FF, p, q, seed)
%UNTITLED4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%
%   �s�m�����v�f��2�̂Ƃ��̃p�X�v�����j���O
%
%   k: �o�H��
%   p: �O�����N����m��
%

% �Z��
cells = [1 2; 3 4];

% ���O�o�H
pre_path = [1 3 4 2];
% ���݂̃Z��
now_cell = 1;
% 1�X�e�b�v�O�̃Z��
pre_cell = 1;
% ���K��Z��
un_visit = [2 3 4];

% �o�H��
k = 0;
flag = 0;
penalty = 5;
rng(seed,'twister')


while true
    
    un_visit;
    
    if size(un_visit, 2) == 0
        break;
    end
    
    if k > 100000
        break;
    end
    
    r1 = rand;
    r2 = rand;
    r3 = rand;
    
    % ���O�o�H�ɂ�鎟�Ɍ������ׂ��Z�������߂�
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,size(TT, 3))+1);
            break;
        end
    end
    
    % ���ɐi�ރZ��
    if r1 > p && r2 > q
        now_cell = next_cell(TT(:, :, now_cell), r3);
    elseif r1 > p && r2 < q
        now_cell = next_cell(TF(:, :, now_cell), r3);
    elseif r1 < p && r2 > q
        now_cell = next_cell(FT(:, :, now_cell), r3);
    elseif r1 < p && r2 < q
        now_cell = next_cell(FF(:, :, now_cell), r3);
    end
    
    if flag == 1
        now_cell = next;
        k = k + penalty;
    else
        k = k + 1;
    end
    flag = 0;
    
    on = 0;
    % ���K��Z���̍X�V
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            if next == now_cell
                un_visit(:, i) = [];
                on = 1;
                break;
            end
        end
    end
    
    now_cell;
    
    if on == 0
        flag = 1;
        %un_visit(:, 1) = [];
        now_cell = pre_cell;
    end
    
    pre_cell = now_cell;
    
end

end

