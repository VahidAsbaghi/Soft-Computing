function coPop=crossov(selpop,Pc)
%% ***************************Crossover Process****************************

% Crossover do:
% 1- for each two selected choromosomes generate 3 random number in [1..'length of choromosome']
% 2- cut two choromosome from generated random numbers points
% 3- changed cut partion parallelism
% set fitness of new individuals to zero

%% ************************************************************************
[len,len1]=size(selpop);
i=0;
newpop=selpop;
l=len;
j=0;

while j<len
    if l~=1
        p=randi([1,len1-1],1,3);
        p=sort(p);
        i=i+1;
        newpop(i,:)=[selpop(i+1,1:p(1)) selpop(i,p(1)+1:p(2)) selpop(i+1,p(2)+1:p(3)) selpop(i,p(3)+1:len1)];
        newpop(i+1,:)=[selpop(i,1:p(1)) selpop(i+1,p(1)+1:p(2)) selpop(i,p(2)+1:p(3))  selpop(i+1,p(3)+1:len1)];
        newpop(i,len1)=0;
        newpop(i+1,len1)=0;
        i=i+1;
    else
        i=i+1;
        newpop(i,:)=selpop(i,:);
    end
    
    l=l-2;
    j=j+2;
end
coPop=newpop;

%**************************************************************************
%*******************************End Function*******************************
end
%**************************************************************************
%**************************************************************************