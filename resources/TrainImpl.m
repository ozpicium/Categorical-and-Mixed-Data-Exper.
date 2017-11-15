clear, close all;
diary on;

%%%% Meta - information %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     1. class: normal find, metastases, malign lymph, fibrosis

%     2. lymphatics: normal, arched, deformed, displaced
%     3. block of affere: no, yes
%     4. bl. of lymph. c: no, yes
%     5. bl. of lymph. s: no, yes
%     6. by pass: no, yes
%     7. extravasates: no, yes
%     8. regeneration of: no, yes
%     9. early uptake in: no, yes
%    10. lym.nodes dimin: 0-3
%    11. lym.nodes enlar: 1-4
%    12. changes in lym.: bean, oval, round
%    13. defect in node: no, lacunar, lac. marginal, lac. central
%    14. changes in node: no, lacunar, lac. margin, lac. central
%    15. changes in stru: no, grainy, drop-like, coarse, diluted, reticular,
%                         stripped, faint,
%    16. special forms: no, chalices, vesicles
%    17. dislocation of: no, yes
%    18. exclusion of no: no, yes
%    19. no. of nodes in: 0-9, 10-19, 20-29, 30-39, 40-49, 50-59, 60-69, >=70

%     normal find:  2
%     metastases:   81
%     malign lymph: 61
%     fibrosis:     4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global PATH
PATH = user_info();


%% PREP
if 0

    dat = importdata(strcat(PATH, 'lympho.txt'), ','); 
    N = size(dat, 1);
    %%% this data should not have any class 1 values
    td = []
    for i = 1:N
        if dat(i,1) ~= 1
            td = vertcat(td, dat(i, :));
        end
    end
    dat = td;
    N = size(dat, 1);
    
    clas = dat(:,1);
    
    %%
    dat = DataPrep(dat);
    
    len = size(dat, 2);
    
    bkp = dat;
    
    %%% sub-set 4 vs all
    datX4 = []; %zeros(N, len);
    x = 1;
    for i = 1:N
        if dat(i,1) == 2 || dat(i,1) == 3 
            if x 
                dat(i,1) = 3;
                datX4 = vertcat(datX4, dat(i,:));
                x = x+1;
            end
        elseif dat(i,1) == 4
            datX4 = vertcat(datX4, dat(i,:));
        end
    end

    dat = bkp;
    
    %%% sub-set 2 vs 3
    dat23 = [];
    for i = 1:N
        if dat(i,1) ~= 4
            dat23 = vertcat(dat23, dat(i, :));
        end
    end
end
 

%% TRAINING
if 1
 
    datX4 = importdata(strcat(PATH, 'lymphoTrainX4.txt'), '\t');
    dat23 = importdata(strcat(PATH, 'lymphoTrain23.txt'), '\t');
    
    
    %% MODEL 2
    %ANFISModelX4 = modelANFIS(datX4);
    ANFISModel23 = modelANFIS(dat23);

    %save ANFISModelX4
    save ANFISModel23
    

    %%  MODEL 1
%     KNNmodel23 = cosineKNN(dat23);
%     GaussSVMmodel23 = GaussianSVM(dat23);
%     CubicSVMmodel23 = cubicSVM(dat23);
%     
%     RUSBoostModelX4 = RUSBoost(datX4);
%     
%     save KNNmodel23
%     save GaussSVMmodel23
%     save CubicSVMmodel23
%     save RUSBoostModelX4

end


