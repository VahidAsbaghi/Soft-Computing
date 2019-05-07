function [Total_Fit,PopB]=GA(popsize,Pc,Pm,Gen,R)
%% ******************Genetic Algorithm Run Function************************

% this function at first define neural network then call and run all 
% functions is needed to avaluation genetic algorithm

%% ************************************************************************

%initial values
h_node=60;
eta=0.6;
mom=0.06;
o_node=10;
i_node=100;
len=6600;
%popsize=12; 
%Pc=0.5;
%Pm=0.2;
%Gen=8;
%R=0.7;

Popn=randi([-R*1000 R*1000],popsize,len+1)/1000; %genetic initial population 
Popn(1:popsize,len+1)=0; % last column is fitness value of each choromosome

%**************IMPORTANT*****************
%load('Popn.mat'); %if want to test genetic reported results by verified 
                    %population please activate this line of code and deactive
                    %two last above line codes ***notice if do it must set
                    % population size to 12****
%**************IMPORTANT*****************

%% ******define custom neural network by 'network' function****************

% three layer neural network 
%network(numInputs,numLayers,biasConnect,inputConnect,layerConnect,outputConnect)
wo=[0,0;1,0]; % layer connect 
wi=(ones(2,i_node)); %input connect
wi(2,:)=0;
net = network(i_node,2,[0;0],wi,wo,[0,1]);

net.layers{1}.size=h_node;
net.layers{2,1}.size=o_node;
for i=1:i_node
    net.inputs{i}.size=1;
end
net.layers{1,1}.transferFcn='tansig';
net.layers{2,1}.transferFcn='logsig';
net.performFcn='sse';
net.trainFcn='traingdm';
net.trainParam.lr=eta;
net.trainParam.mc=mom;
%********************** end network definition*****************************
%**************************************************************************

%reading input images and specify target values
[T,input]=imageread();

%run genetic algorithm for number of generations
for i=1:Gen 
    Pop=Popn;
    [fitnes,total_fit(i)]=fit_n(Pop,popsize,net,len,input,T);
    Pop(1:popsize,len+1)=fitnes;
    selpop=rouletw(Pop,fitnes,popsize,Pc);
    coPop=crossov(selpop,Pc);
    mupop=mutat(coPop,Pm);
    Popn=replace(Pop,mupop,fitnes,popsize);
end
[C,I]=min(fitnes);
PopB=Pop(I,:);%select best choromosome to specify initial NN weights.
Total_Fit=min(total_fit);

%**************************************************************************
%******************************End Function********************************
end
%**************************************************************************
%**************************************************************************