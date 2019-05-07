function [TSSE,FR]=neuralTrain(eta,mom,R,epoch)
%% ********************Neural Network Train Function***********************

% this function at first define network by 'network' function-- then set
% weight values randomlly in [-R R] interval-- then evaluate input and 
% target by calling 'imageread'
% then train neural network and evaluate needed outputs-- then thresholding
% output value and compare with target values and evaluate failure rate

%% ************************************************************************

h_node=60;
%eta=0.4;
%mom=0.06;
o_node=10;
i_node=100;
len=6600;
%R=0.7;

wo=[0,0;1,0];
wi=boolean(ones(2,i_node));
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
net.trainParam.epochs=epoch;
net.trainParam.goal=.000057;


load('IW.mat');
load('LW.mat');
for i=0:i_node-1
    net.IW{1,i+1}=randi([-R*1000 R*1000],60,1)/1000;
    %net.IW{1,i+1}=IW{1,i+1}; 
%***********Important*************************************
    %if want to test and examine reported results about NN 
    %please deactive line 39 and activate line 40 
%*********************************************************
end
net.LW{2,1}=randi([-R*1000 R*1000],10,60)/1000;
%net.LW{2,1}=LW{2,1};
%***********Important*************************************
    %if want to test and examine reported results about NN 
    %please deactive line 46 and activate line 47 
%*********************************************************

[T,input]=imageread();

[net1,tr,Yt,Et,Pf,Af] = train(net,input,T,[],[]);
[m,n]=size(Yt);
NOC=0;
Yg=Yt;
for i=1:n
    SSE(i)=sse(Et(:,i));
    for j=1:m
        if (Yg(j,i)>0.9)
            Yg(j,i)=1;
        elseif (Yg(j,i)<0.1)
            Yg(j,i)=0;
        end
    end
    if(Yg(:,i)==T(:,i))
        NOC=NOC+1;
    end
end
TSSE=mean(SSE);
FR=(n-NOC)*100/n;

%**************************************************************************
%*******************************End Function*******************************
end
%**************************************************************************
%**************************************************************************