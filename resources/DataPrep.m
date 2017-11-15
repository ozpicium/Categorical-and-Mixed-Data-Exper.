function dat = DataPrep(dat)
        %%% Pre-processing
        classes = dat(:,1);
        dat = dat(:, (2:19));

        %%% encoding
        dat = encodeDat(dat, 1);
        dat = [classes dat];
end