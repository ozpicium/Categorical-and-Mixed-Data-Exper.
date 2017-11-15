function evalModel2(datE, modelX4, model23)
     global PATH 
     %global PRED
%      global modelX4
%      global model23
     
     N = size(datE, 1);
     PRED = zeros(N,1);
     
     encDatE = DataPrep(datE);      %%% encoded data
     
     %%% iterate over each test data and get prediction...add to PRED
     for i = 1:N
         if datE(i, 2) == 1       %%% Lymphatic Normal
             PRED(i) = 1;
         else         
             tempDat = encDatE(i, 2:size(encDatE,2));
             %%% feed to 4 vs all model
             %pred = evalfis(tempDat, modelX4);
             pred = predict(modelX4, tempDat);
             if pred == 4
                 PRED(i) = 4;
             else
                 %%% feed to 2 vs 3 model
                 pred = evalfis(tempDat, model23);
                 PRED(i) = pred;
             end
         end
     end
     
     trueC = datE(:,1);
     
     for i = 1:length(PRED)
        PRED(i) = round(PRED(i));
        if PRED(i) > 4
            PRED(i) = 4;
        elseif PRED(i) < 1
            PRED(i) = 1;
        end
     end
     
     
     TrueLabel_PredLabel = [trueC PRED]
     
     CP = classperf(trueC, PRED);
     PerClassError = CP.ErrorDistributionbyClass
     ConfMat = CP.CountingMatrix'
     
end