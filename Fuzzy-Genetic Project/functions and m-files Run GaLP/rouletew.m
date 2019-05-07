%% Roulete Wheel Algorithm 
% selected population for muatation n = mutation_rate * population_size
%selected population for crossover n = crossover_rate * population_size
%% Algorithm Steps:
%1- calculate probability of each fitness function value 
%2- calculate q(i)=sum(p(1:i))--- comulative sum of probabilities
%3- production a random number r=[0,1]
%4- if q(1)> r select first coromosom for mating 
%5- else first coromosom where q(i)>r for i>1 select for mating
%6- do steps 3,4,5 until n number of papulation selected for mating
%%
function [zz,Papt]=rouletew(z,Pap,Rate)
p=z./sum(z);
for i=1:length(z)
    q(i)=sum(p(1:i));
end
i=1;
while (i<=length(z)*Rate)
    r=randi([1 10000])/10000;
    if (q(1)>r)
        j(i)=1;
        i=i+1;
    else
        for k=2:length(z)
            if (r<=q(k))
                j(i)=k;
                i=i+1;
                break;
            end
        end
    end
end
zz=j;
Papt=Pap(zz,:);
end
