function file_output( file_name, data )
%UNTITLED ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

csvwrite(strcat(file_name, '.csv'), data);

for i=1:5
    
    a = data(7:14, i);
    figure;
    bar(a);
    xticklabels({'A��B', 'A��C', 'B��A', 'B��D', 'C��A', 'C��D', 'D��B', 'D��C'});
    ylim([0 5]);
    yticks(0:1:5);
    
    saveas(gcf, strcat(file_name, strcat('_q=0', strcat(num2str(i), '.png'))));
end


end
