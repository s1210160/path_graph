function num_simulation(  )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述
close all
clear all

folder = 'experiment/2_2/mov+env/ABDC/';
penalty = 5;

%ABDC

tt = [0 1 0 0;
      0 0 0 1;
      1 0 0 0;
      0 0 1 0];
tf = [0.5 0.5 0 0 ;
      0.5 0 0 0.5;
      0.5 0 0.5 0;
      0 0 1 0];
ft = [0 0 1 0 ;
      1 0 0 0 ;
      0 0 0 1;
      0 1 0 0];
ff = [0 0 1 0;
      1 0 0 0;
      0 0 0.5 0.5;
      0 0.5 0.5 0];


%ADCB
%{
tt = [0 0 1 0 ;
      1 0 0 0 ;
      0 0 0 1;
      0 1 0 0];
tf = [0.5 0 0.5 0 ;
      1 0 0 0;
      0 0 0.5 0.5;
      0 0.5 0.5 0];
ft = [0 1 0 0;
      0 0 0 1;
      1 0 0 0;
      0 0 1 0];
ff = [0.5 0.5 0 0;
      0.5 0 0 0.5;
      0.5 0 0.5 0;
      0 0 1 0];
%}


for p=0:0.1:1
    for q=0:0.1:1
        
        P = (1-p)*(1-q)*tt + (1-p)*q*tf + p*(1-q)*ft + p*q*ff;
        
        P_AA = P(1, 1);
        P_AB = P(1, 2);
        P_AC = P(1, 3);
        P_BA = P(2, 1);
        P_BD = P(2, 4);
        P_CA = P(3, 1);
        P_CC = P(3, 3);
        P_CD = P(3, 4);
        P_DB = P(4, 2);
        P_DC = P(4, 3);
        
        %ABDC
        
        F = [P_AA P_AC;
             P_BA 0;
             P_DB 0];
        T = [P_AB; P_BD; P_DC];
        
        
        %ACDB
        %{
        F = [P_AA P_AB;
             P_CA P_CC;
             P_DC 0];
        T = [P_AC; P_CD; P_DB];
        %}
        
        s = T(1) * T(2) * T(3);
        e = 3 * s;
        %e = s;
        
        f = 0;
        c = 1;
        for i=1:size(F, 1)
            for j=1:size(F, 2)
                for t=1:size(T)
                    if t ~= i
                        c = c * T(t);
                    end
                end
                f = f + c * F(i, j);
                c = 1;
            end
        end
        if isnan(f) == 0
            e = e + (3+penalty) * f;
            %e = e + f;
        end
        
        f = 0;
        c = 1;
        for i=1:size(F, 1)-1
            for j=1:size(F, 2)
                for k=i+1:size(F, 1)
                    for l=1:size(F, 2)
                        for t=1:size(T)
                            if t ~= i && t ~= k
                                c = c * T(t);
                            end
                        end
                        f = f + c * (F(i, j)*F(k, l));
                        c = 1;
                    end
                end
            end
        end
        if isnan(f) == 0
            e = e + (3+2*penalty) * f;
            %e = e + f;
        end
        
       f = 0;
       for i=1:2
           for j=1:2
               for k=1:2
                   f = f + (F(1, i)*F(2, j)*F(3, k));
               end
           end
       end
       if isnan(f) == 0
           e = e + (3+3*penalty) * f;
           %e = e + f;
       end
       
       result(fix(q*10)+1, fix(p*10)+1) = e;

    end
end

result
csvwrite(strcat(folder, 'num_simulation.csv'), result);

figure;
colormap jet;
imagesc([0 1], [0 1], result);
set(gca,'YDir','normal');
colorbar;
xlabel('\it p', 'FontSize', 18);
ylabel('\it q', 'FontSize', 18);
axis square;

saveas(gcf, strcat(folder, 'heatmap.png'));

end

