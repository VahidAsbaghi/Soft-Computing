%% Genetic Learning Process

%Replacement Method: elite select
%Selection: Roullete Wheel
%Crossover: Three-Point Recombine
%Mutation: Random Reset One Gene
%Initial Population: Random Select
%%
clear all;
clc;
close all;
MR=0.15;
CR=0.3;
Gen=5; % by this generation number duration of implementation is about 1.5 minutes 
Pap=zeros(100,125);
%% NOTICE:if want generate population randomly activate this cell
%for i=1:100
 %   for j=1:125
  %      Pap(i,j)=randi([0 5]);
   % end
%end
%% IMPORTANT NOTICE
load('Papst.mat'); %if active above cell please deactive this and next line code
Pap=Papst;          %
%%
%save('Papst.txt',Papst);
[inputF,classF,rulelist]=imageread();
z=0;
f1=0;
%%
tic();
for i=1:Gen
    [z1,f1,f2,w1,w2,sysf]=sysfuzl(Pap,rulelist,inputF,classF);
    Old(i).p=f1;
    Paptemp=Pap;
    
    Rate=CR;
    [zz,Pap1]=rouletew(z1,Pap,Rate);
    crov=crosovr(Pap1);
    
    Rate=MR;
    [zz,Pap1]=rouletew(z1,Pap,Rate);
    muout1=mutat(Pap1);
    
    Pap=elitism(Pap,muout1,z1,crov);
    OldP(i).p=Pap;
end
time=toc();
%% Fuzzy System Tuning

mat=[0,0,42,84,42,84,84,126,84,126,126,...
    168,126,168,168,210,168,210,255,255];

for i=1:20
    PapF(i,:)=[mat,mat,mat];
end
[max1,I]=max(z1);
ruletar=Paptemp(I,:);
ccrle=f1(I);
NURle=f2(I);
CCR=zeros(20,1);
%%
tic();
for i=1:Gen
    [OutF,CCR]=fuzzysys(inputF,PapF,ruletar,classF,rulelist);
    pp(i).po=PapF;
    
    if (i==Gen)
        close all;
        [maxx,ii]=max(CCR);
        plotpop=PapF(ii,:);
        s=PlotMFs(plotpop,maxx);
    end
    
    Rate=CR;
    [zz,Pap1]=rouletew(CCR,PapF,Rate);
    crov=crosovr(Pap1);
    
    Rate=MR;
    [zz,Pap1]=rouletew(CCR,PapF,Rate);
    muout1=mutatF(Pap1);
    
    PapF=elitism(PapF,muout1,CCR,crov);
end
time1=toc();
