function [ax] = base_plot()
%UNTITLED3 この関数の概要をここに記述
%   詳細説明をここに記述


% 水田のプロット
figure;
hold on;
% ターゲットのプロット
axis([0 2 0 2]);
axis square;
grid on;
ax = gca;
ax.GridAlpha = 0.5;
ax.LineWidth = 1.0;
ax.XTick = (0:1:2);
ax.YTick = (0:1:2);


end

