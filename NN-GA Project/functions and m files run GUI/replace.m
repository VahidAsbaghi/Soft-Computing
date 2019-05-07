function newPop=replace(Pop,mupop,fitval,popsize)
%% ********************Genetic Replace Function****************************

% this function replace old population by new one-- select 0.3 of last
% population's best choromosomes-- insert new choromoses from mate process
% to new population-- and remain places is filled by random select from 
% last population

%% ************************************************************************
eliter=0.3;
[len,len1]=size(mupop);
numelite=round(eliter*popsize);
randPop=popsize-numelite-len;

newPop(1:randPop,:)=Pop(randi([1,popsize],1,randPop),:);%insert random selected choromosomes

%insert mating result population to new population
for i=1:len
    newPop(randPop+i,:)=mupop(i,:);
end

%insert elite choromosomes 
for j=1:numelite
    [maxi,J]=min(fitval);
    newPop(randPop+len+j,:)=Pop(J,:);
    fitval(J)=10000;
end

%**************************************************************************
%**********************************End Function****************************
end
%**************************************************************************
%**************************************************************************