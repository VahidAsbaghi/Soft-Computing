function selpop=rouletw(Pop,fitnes,Popsize,Pc)
%% ************* Selection Algorithm is Roulette Wheel ********************

% because 'RW'(roulette wheel) give more change to probable choromosomes or
% choromosomes with greater fitness and in this genetic algorithm we want
% minimize fitness so to evaluate probabilities at first reverse fitness
% values---
% Roulette wheel do:
% 1- evaluate each choromosome probability by fitness
% 2- compute cumulative sum of probabilities namely 'q'
% 3- for i=1 to Popsize*Pc where Pc is crossover rate Do:
% 4- generate arandom number in [0 1] namely 'r'
% 5- if r<q(1) then select first choromosome else for k=2 to Popsize select
%       first choromosome that r<=q(k)
% 6- End Do;

%% ************************************************************************

fitnes=(1./fitnes);
prob=fitnes./sum(fitnes);
q=cumsum(prob);

i=1;
while (i<=Popsize*Pc)
    r=randi([1 1000])/1000;
    if (q(1)>r)
        j(i)=1;
        i=i+1;
    else
        for k=2:Popsize
            if (r<=q(k))
                j(i)=k;
                i=i+1;
                break;
            end
        end
    end
selpop(i-1,:)=Pop(j(i-1),:);    
end

%**************************************************************************
%*******************************End Function*******************************
end
%**************************************************************************
%**************************************************************************