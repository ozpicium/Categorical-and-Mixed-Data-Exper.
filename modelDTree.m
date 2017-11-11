function conf_mat = modelDTree(train_dat, train_cat, test_dat, test_cat)
    
    DT = fitctree(train_dat, train_cat);
    
    [pred, score] = predict(DT, test_dat); 

    conf_mat = zeros(4, 4);
    for i = 1:length(pred)
            conf_mat(test_cat(i), pred(i)) = conf_mat(test_cat(i), pred(i)) + 1;
    end
    
    score;
end