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
PATH = get_path();

delimiter = ',';
dat = importdata(strcat(PATH, 'lympho.txt'), delimiter);
N = 148;


%% Remove sparse classes
dat2 = zeros(148-6, 19);
k = 1;
for i = 1:size(dat,1)
    if dat(i, 1) == 1 || dat(i,1) == 4
        continue;
    else
        dat2(k, :) = dat(i, :);
        k = k+1;
    end
end
N = k-1;
dat = dat2;


%% Pre-processing
classes = dat(:,1);
dat = dat(:, (2:19));

% analysis(dat, classes);
% 
% pause;

%%% encoding %%%%
edat = encodeDat(dat, 1);
dat = edat;

%pause;

%%
%rng = 1:N;
rng = randperm(N);
train_rng = 1:50;
test_rng = 51:N;

train_dat = dat (rng([train_rng]), :);
test_dat = dat (rng([test_rng]), :);

train_cat = classes(rng([train_rng]));
test_cat = classes(rng([test_rng]));





%%
SVMconf_mat = modelSVM(train_dat, train_cat, test_dat, test_cat)
DTREEconf_mat = modelDTree(train_dat, train_cat, test_dat, test_cat)
