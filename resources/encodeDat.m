%     1. lymphatics: normal, arched, deformed, displaced   
%     2. block of affere: no, yes
%     3. bl. of lymph. c: no, yes
%     4. bl. of lymph. s: no, yes
%     5. by pass: no, yes
%     6. extravasates: no, yes
%     7. regeneration of: no, yes
%     8. early uptake in: no, yes
%    9. lym.nodes dimin: 0-3
%    10. lym.nodes enlar: 1-4
%    11. changes in lym.: bean, oval, round
%    12. defect in node: no, lacunar, lac. marginal, lac. central
%    13. changes in node: no, lacunar, lac. margin, lac. central
%    14. changes in stru: no, grainy, drop-like, coarse, diluted, reticular,
%                        stripped, faint,
%    15. special forms: no, chalices, vesicles
%    16. dislocation of: no, yes
%    17. exclusion of no: no, yes
%    18. no. of nodes in: 0-9, 10-19, 20-29, 30-39, 40-49, 50-59, 60-69, >=70
function edat = encodeDat(dat, type)
    
    if (type == 1)
        edat = hotEncode(dat) + 1;  %%% +1 to avoid zero calues
    elseif (type == 2)
        edat = binaryEncode(dat) + 1;  %%% +1 to avoid zero calues
    else
        edat = dat;
    end
    
end



function hdat = hotEncode(dat)

    %%% hot code
    hdat = [];
    
    
    for i=1:size(dat,1)
        hdi = [];
        
        % 1
        tmp = [0,0,0,0];
        tmp(dat(i,1)) = 1;
        hdi = [hdi, tmp];
        
        % 2
        tmp = [0,0];
        tmp(dat(i,2)) = 1;
        hdi = [hdi, tmp];
        
        % 3
        tmp = [0,0];
        tmp(dat(i,3)) = 1;
        hdi = [hdi, tmp];
        
        % 4
        tmp = [0,0];
        tmp(dat(i,4)) = 1;
        hdi = [hdi, tmp];
        
        % 5
        tmp = [0,0];
        tmp(dat(i,5)) = 1;
        hdi = [hdi, tmp];
        
        % 6
        tmp = [0,0];
        tmp(dat(i,6)) = 1;
        hdi = [hdi, tmp];
        
        % 7
        tmp = [0,0];
        tmp(dat(i,7)) = 1;
        hdi = [hdi, tmp];
        
        % 8
        tmp = [0,0];
        tmp(dat(i,8)) = 1;
        hdi = [hdi, tmp];
        
        % 9 & 10
        tmp = [0,0, 0, 0];
        tmp(dat(i,9)) = 1;
        tmp = dat(i,9);
        hdi = [hdi, tmp];
        
        tmp = [0,0, 0, 0];
        tmp(dat(i,10)) = 1;
        tmp = dat(i,10);
        hdi = [hdi, tmp];
        
        
        % 11
        tmp = [0,0,0];
        tmp(dat(i,11)) = 1;
        hdi = [hdi, tmp];
        
        % 12
        tmp = [0,0,0,0];
        tmp(dat(i,12)) = 1;
        hdi = [hdi, tmp];
        
        % 13
        tmp = [0,0,0,0];
        tmp(dat(i,13)) = 1;
        hdi = [hdi, tmp];
       
        % 14
        tmp = [0,0,0,0,0,0,0,0];
        tmp(dat(i,14)) = 1;
        hdi = [hdi, tmp];
        
        % 15
        tmp = [0,0,0];
        tmp(dat(i,15)) = 1;
        hdi = [hdi, tmp];
        
         % 16
        tmp = [0,0];
        tmp(dat(i,16)) = 1;
        hdi = [hdi, tmp];
        
         % 17
        tmp = [0,0];
        tmp(dat(i,17)) = 1;
        hdi = [hdi, tmp];
        
        % 18
        tmp = [0, 0, 0, 0, 0, 0, 0, 0];
        tmp(dat(i,18)) = 1;
        tmp = dat(i,18);
        hdi = [hdi, tmp];
        
        
        hdat = [hdat; hdi];
    end
end

function hdat = binaryEncode(dat)
   hdat = [];
    
    
    for i=1:size(dat,1)
        hdi = [];
        
        % 1
        tmp = [0,0,0];
        tmp2 = de2bi(dat(i,1));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 2
        tmp = [0,0];
        tmp2 = de2bi(dat(i,2));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 3
        tmp = [0,0];
        tmp2 = de2bi(dat(i,3));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 4
        tmp = [0,0];
        tmp2 = de2bi(dat(i,4));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 5
        tmp = [0,0];
        tmp2 = de2bi(dat(i,5));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 6
        tmp = [0,0];
        tmp2 = de2bi(dat(i,6));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 7
        tmp = [0,0];
        tmp2 = de2bi(dat(i,7));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 8
        tmp = [0,0];
        tmp2 = de2bi(dat(i,8));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 9 & 10
        hdi = [hdi, dat(i,9)];
        hdi = [hdi, dat(i,10)];
        
        % 11
        tmp = [0,0];
        tmp2 = de2bi(dat(i,11));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 12
        tmp = [0,0,0];
        tmp2 = de2bi(dat(i,12));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 13
        tmp = [0,0,0];
        tmp2 = de2bi(dat(i,13));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 14
        tmp = [0,0,0,0];
        tmp2 = de2bi(dat(i,14));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 15
        tmp = [0,0];
        tmp2 = de2bi(dat(i,15));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
         % 16
        tmp = [0,0];
        tmp2 = de2bi(dat(i,16));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
         % 17
        tmp = [0,0];
        tmp2 = de2bi(dat(i,17));
        for z = 1:length(tmp2)
            tmp(z) = tmp2(z);
        end
        hdi = [hdi, tmp];
        
        % 18
        hdi = [hdi, dat(i,18)];
        
        
        hdat = [hdat; hdi];
    end
end