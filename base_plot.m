function [ax] = base_plot()
%UNTITLED3 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q


% ���c�̃v���b�g
figure;
hold on;
% �^�[�Q�b�g�̃v���b�g
axis([0 2 0 2]);
axis square;
grid on;
ax = gca;
ax.GridAlpha = 0.5;
ax.LineWidth = 1.0;
ax.XTick = (0:1:2);
ax.YTick = (0:1:2);


end

