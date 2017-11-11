function op = analysis(dat, classes)
    op = 0;
        
    attr = 1:18;
    
    grp1 = [];
    grp2 = [];
    grp3 = [];
    grp4 = [];
    
    for i = 1:length(dat)
        if classes(i) == 1
            grp1 = [grp1; dat(i,:)];
        elseif classes(i) == 2
            grp2 = [grp2; dat(i,:)];
        elseif classes(i) == 3
            grp3 = [grp3; dat(i,:)];
        elseif classes(i) == 4
            grp4 = [grp4; dat(i,:)];
        end
    end
    
    %%
    figure;
    for i = 1:size(grp4,1)
        plot(attr, grp4(i,:));
        hold on
    end
    hold off
    
    figure;
    for i = 1:size(grp1,1)
        plot(attr, grp1(i,:));
        hold on
    end
    hold off
    
    figure;
    for i = 1:size(grp2,1)
        plot(attr, grp2(i,:));
        hold on
    end
    hold off
    
    figure;
    for i = 1:size(grp3,1)
        plot(attr, grp3(i,:));
        hold on
    end
    hold off
    
    
    %% Outlier diffs Class 1%%
    
    %%% ref from grp2 %%%
%     refs = [];
%     for i = 1:size(grp1, 1)
%         min_i = inf;
%         ref_i = 0;
%         for j = 1:size(grp2, 1)
%             diff = sum(abs(grp1(i,:) - grp2(j,:)));
%             if(diff < min_i)
%                 min_i = diff;
%                 ref_i = j;
%             end
%         end
%         
%         refs = [refs ref_i];
%     end
% 
%     for i = 1:length(refs)
%         grp2(refs(i), :);
%         abs(grp1(i,:) - grp2(refs(i),:))
%     end
%     
%     
%     %%% ref from grp3 %%%
%     refs = [];
%     for i = 1:size(grp1, 1)
%         min_i = inf;
%         ref_i = 0;
%         for j = 1:size(grp3, 1)
%             diff = sum(abs(grp1(i,:) - grp3(j,:)));
%             if(diff < min_i)
%                 min_i = diff;
%                 ref_i = j;
%             end
%         end
%         
%         refs = [refs ref_i];
%     end
% 
%     for i = 1:length(refs)
%         grp3(refs(i), :);
%         abs(grp1(i,:) - grp3(refs(i),:))
%     end
%     

    %% Outlier diffs Class 4%%
    %%% ref from grp2 %%%
    refs = [];
    for i = 1:size(grp4, 1)
        min_i = inf;
        ref_i = 0;
        for j = 1:size(grp2, 1)
            diff = sum(abs(grp4(i,:) - grp2(j,:)));
            if(diff < min_i)
                min_i = diff;
                ref_i = j;
            end
        end
        
        refs = [refs ref_i];
    end

    for i = 1:length(refs)
        grp2(refs(i), :);
        abs(grp4(i,:) - grp2(refs(i),:))
    end
    
    
    %%% ref from grp3 %%%
    refs = [];
    for i = 1:size(grp4, 1)
        min_i = inf;
        ref_i = 0;
        for j = 1:size(grp3, 1)
            diff = sum(abs(grp4(i,:) - grp3(j,:)));
            if(diff < min_i)
                min_i = diff;
                ref_i = j;
            end
        end
        
        refs = [refs ref_i];
    end

    for i = 1:length(refs)
        grp3(refs(i), :);
        abs(grp4(i,:) - grp3(refs(i),:))
    end
    
    %%
    
end

