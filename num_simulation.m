function num_simulation(  )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述


k = 5;

for p=0:0.1:1
    for q=0:0.1:1
        
        P_AB = (1-p)*(1-q)*1 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*0;
        P_AC = (1-p)*(1-q)*0 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*1;
        P_BD = (1-p)*(1-q)*1 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*0;
        P_BA = (1-p)*(1-q)*0 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*1;
        P_DC = (1-p)*(1-q)*0.5 + (1-p)*q*1 + p*(1-q)*0 + p*q*0.5;
        P_DB = (1-p)*(1-q)*0.5 + (1-p)*q*0 + p*(1-q)*1 + p*q*0.5;
        P_CA = (1-p)*(1-q)*0.5 + (1-p)*q*1 + p*(1-q)*0 + p*q*0.5;
        P_CD = (1-p)*(1-q)*0.5 + (1-p)*q*0 + p*(1-q)*1 + p*q*0.5;


        e(fix(q*10)+1, fix(p*10)+1) = 3 * P_AB * P_BD * P_DC + (3+k) * P_AB * P_BD * P_DB + (3+k) * P_AB * P_BA * P_DC + (3+2*k) * P_AB * P_BA * P_DB + (3+k) * P_AC * P_BD * P_DC + (3+2*k) * P_AC * P_BD * P_DB + (3+2*k) * P_AC * P_BA * P_DC + (3+3*k) * P_AC * P_BA * P_DB 
    end
end

for p=0:0.1:1
    for q=0:0.1:1
        
        P_AB = (1-p)*(1-q)*0.5 + (1-p)*q*0 + p*(1-q)*1 + p*q*0.5;
        P_AC = (1-p)*(1-q)*0.5 + (1-p)*q*1 + p*(1-q)*0 + p*q*0.5;
        P_BD = (1-p)*(1-q)*0.5 + (1-p)*q*0 + p*(1-q)*1 + p*q*0.5;
        P_BA = (1-p)*(1-q)*0.5 + (1-p)*q*1 + p*(1-q)*0 + p*q*0.5;
        P_DC = (1-p)*(1-q)*0 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*1;
        P_DB = (1-p)*(1-q)*1 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*0;
        P_CA = (1-p)*(1-q)*0 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*1;
        P_CD = (1-p)*(1-q)*1 + (1-p)*q*0.5 + p*(1-q)*0.5 + p*q*0;


        e(12+fix(q*10)+1, fix(p*10)+1) = 3 * P_AC * P_CD * P_DB + (3+k) * P_AC * P_CD * P_DC + (3+k) * P_AC * P_CA * P_DB + (3+2*k) * P_AC * P_CA * P_DC + (3+k) * P_AB * P_CD * P_DB + (3+2*k) * P_AB * P_CD * P_DC + (3+2*k) * P_AB * P_CA * P_DB + (3+3*k) * P_AB * P_CA * P_DC 
    end
end

csvwrite('experiment/num_simulation.csv', e);

end

