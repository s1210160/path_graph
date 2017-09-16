function file_output( file_name, data )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述

csvwrite(strcat(file_name, '.csv'), data);

%{
for i=1:1:1
    
    a = data(12:19, i);
    figure;
    bar(a);
    xticklabels({'A→B', 'A→C', 'B→A', 'B→D', 'C→A', 'C→D', 'D→B', 'D→C'});
    ylim([0 5]);
    yticks(0:1:5);
    
    saveas(gcf, strcat(file_name, strcat('_q=0', strcat(num2str(i-1), '.png'))));
end
%}

end

