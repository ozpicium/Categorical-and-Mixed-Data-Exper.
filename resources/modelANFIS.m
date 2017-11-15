% clear, close all;
% 
% load fuzex1trnData.dat;
% 
% fis = anfis(fuzex1trnData);
% 
% x = fuzex1trnData(:,1);
% anfisOutput = evalfis(x,fis);
% plot(x,fuzex1trnData(:,2),'*r',x,anfisOutput,'.b')
% legend('Training Data','ANFIS Output','Location','NorthWest')

function ANF = modelANFIS(train_dat2)
    
      dTlen = size(train_dat2,2);
      dT = [train_dat2(:, 2:dTlen) train_dat2(:,1)]
      
%       for i = 1:size(dT,1)
%           if dT(i, dTlen) == 2
%               dT(i, dTlen) = 1;
%           elseif dT(i, dTlen) == 3
%               dT(i, dTlen) = 2;
%           elseif dT(i, dTlen) == 4
%               dT(i, dTlen) = 3;
%           end
%       end
      
      
     %%% generate intiial FIS
     'Generating FIS'

     genOpt = genfisOptions('SubtractiveClustering');
     inFIS = genfis(dT(:,1:(dTlen-1)), dT(:, dTlen), genOpt);
    
    
     'Train ANFIS'
     opt = anfisOptions('InitialFIS', inFIS, 'EpochNumber', 10);

     [ANF, trainError] = anfis(dT, opt);

     'Done ANFIS'
    
end