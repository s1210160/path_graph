function [k, path] = main2(Mov, Env, seed)
%UNTITLED4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%
%   �s�m�����v�f��2�̂Ƃ��̃p�X�v�����j���O
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
path = zeros(size(Mov, 3));
rng(seed,'twister')

while true
    
    if size(un_visit, 2) == 0
        break;
    end
    
    if k > 100000
        break;
    end
    
    r1 = rand;
    r2 = rand;
    
    % ���O�o�H�ɂ�鎟�Ɍ������ׂ��Z�������߂�
    for i=1:size(pre_path, 2)
        if pre_path(i) ==  now_cell
            next = pre_path(mod(i,size(Mov, 3))+1);
            break;
        end
    end
    
    % ���ɐi�ރZ��
    now1 = next_cell(Mov(:, :, now_cell), r1);
    now2 = next_cell(Env(:, :, now_cell), r2);
    if now1 ~= now2
        r3 = rand;
        if r3 < 0.5
            now_cell = now1;
        else
            now_cell = now2;
        end
    else
        now_cell = now1;
    end
    
    
    % ���K��Z���̍X�V
    for i=1:size(un_visit, 2)
        if un_visit(:, i) == now_cell
            %if next == now_cell
                un_visit(:, i) = [];
                break;
        
           %end
        end
    end
    
    
    k = k + 1;
    path(pre_cell, now_cell) = path(pre_cell, now_cell) + 1;
    
    pre_cell = now_cell;
end

end

