function conf_mat = modelSVM(train_dat, train_cat, test_dat, test_cat)

    %%%%% Class Suppression %%%%%%%
    for i = 1:length(train_cat)
        if train_cat(i) == 1 || train_cat(i) == 4
            train_cat(i) = 3;
        end
    end
    for i = 1:length(test_cat)
        if test_cat(i) == 1 || test_cat(i) == 4
            test_cat(i) = 3;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    SV = fitcsvm(train_dat, train_cat);

    [pred, score] = predict(SV, test_dat); 

    conf_mat = zeros(2,2);
    for i = 1:length(pred)
            conf_mat(test_cat(i)-1, pred(i)-1) = conf_mat(test_cat(i)-1, pred(i)-1) + 1;
    end

    score;
end

