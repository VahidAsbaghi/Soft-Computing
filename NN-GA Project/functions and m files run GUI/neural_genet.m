function [TSSE,FR]=neural_genet(PopB,eta,mom,epoch)
%% **************Function to Run Neural-Genetic Program********************

% this function at first define network by 'network' function-- then set
% weight values by best choromosome that come from and evaluate by 
% genetic algorithm-- then evaluate input and target by calling 'imageread'
% then train neural network and evaluate needed outputs-- then thresholding
% output value and compare with target values and evaluate failure rate

%% ************************************************************************
h_node=60;
%eta=0.6;
%mom=0.06;
o_node=10;
i_node=100;
len=6600;

wo=[0,0;1,0];
wi=boolean(ones(2,100));
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

for i=0:99
    net.IW{1,i+1}=PopB(1,i*60+1:(i+1)*60)';
end
net.LW{2,1}=reshape(PopB(1,6001:len),10,60);

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
%*****************************End Function*********************************
end
%**************************************************************************
%**************************************************************************