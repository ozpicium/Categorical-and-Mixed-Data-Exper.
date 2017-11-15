clear, close all;

global PATH
global EVAL_FILE

[PATH, EVAL_FILE, modl] = user_info();


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%% MODEL 1 %%%
load KNNmodel23
load GaussSVMmodel23
load CubicSVMmodel23
load RUSBoostModelX4

%%% MODEL 2 %%%
load ANFISModelX4
load ANFISModel23


 %% EVALUATION

 datE = importdata(strcat(PATH, EVAL_FILE), ',');

%  if modl == 1
%      
%      modelX4 = RUSBoostModelX4;
%      
%      model23 = KNNmodel23;
%      %model23 = GaussSVMmodel23;
%      %model23 = CubicSVMmodel23;
%      
%      evalModel1(datE, modelX4, model23);
%      
%  else
%      
%      modelX4 = ANFISModelX4;
%      modelX4 = RUSBoostModelX4;
%      model23 = ANFISModel23;
%      
%      evalModel2(datE, modelX4, model23);
%      
%  end
     
dat23 = [dat23(:, 2:size(dat23,2)), dat23(:, 1)];
