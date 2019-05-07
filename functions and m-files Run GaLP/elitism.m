%% Elitism Function for Replacement
% new generation= mutation_rate*pop_size 
%                   + Crossover_rate*pop_size
%                       + 0.1*pop_size(select 10% of best chromosomes)
%                           + (1-mutation_rate-Crossover_rate-0.1)*pop_size...
%                               ...randomly selected of parents
%elitism increase speed of convergence but increase probability of local
%        minima   
function out1=elitism(Pap,muout,z1,crov)
%%
len=length(z1);
z1t(:,1)=z1;
z1t(:,2)=(1:len);

rate=0.1;
newPap=zeros(len,length(Pap(1,:)));

LeRan=rate*length(Pap(:,1));
LeMuOut=length(muout(:,1));
LeCrOut=length(crov(:,1));

for j=1:len-LeMuOut-LeCrOut-LeRan
    ran=randi([1 len]);
    newPap(j,:)=Pap(ran,:);
end
for j=len+1-LeMuOut-LeCrOut-LeRan:len-LeCrOut-LeRan
    newPap(j,:)=muout(j-len+LeMuOut+LeCrOut+LeRan,:);
end
for j=len+1-LeCrOut-LeRan:len-LeRan
    newPap(j,:)=crov(j-len+LeCrOut+LeRan,:);
end
for j=len+1-LeRan:len
    max=0;
    for i=1:len
        if(z1t(i,1)>max)
            max=z1t(i,1);
            maxi=z1t(i,2);
        end
    end
    
    z1t(maxi,1)=0;
    
    newPap(j,:)=Pap(maxi,:);
end
out1=newPap;
end