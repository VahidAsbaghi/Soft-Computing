function [fitnes,total_fit]=fit_n(Pop,popsize,net,len,input,T)
%% **********************Fitness Function**********************************

%fitness function do: check if repeat population's individuals then
%dont avaluate fitness again and use last fitness value but if
%individual was new from mate process then compute fitness by set 'iw' and
%'ow' by gens of choromosome values and simulate neural network for one
%step then evaluate output and determine TSSE 

%% ************************************************************************
[m,n]=size(input);

for i=1:popsize
    if Pop(i,len+1)~=0
        TSSE(i)=Pop(i,len+1);
    else
        for j=0:99
            %net.inputWeights{1,j+1}.size=zeros(60,1);
            net.iw{1,j+1}=Pop(i,j*60+1:(j+1)*60)';
        end
        net.LW{2,1}=reshape(Pop(i,6001:len),10,60);
        %[Y,Pf,Af,E,perf]=sim(net,input,[],[],T);
        %[net,Y,E,Pf,Af,tr]=adapt(net,input,T,[],[]);
        Y=net(input);
        TSSE(i)=sse(net,T,Y);
       % for t=1:n
        %    SSE(t)=sse(E(:,t));
        %end
        %TSSE(i)=mean(SSE);
    end
end
fitnes=TSSE;
total_fit=mean(TSSE);

%*************************************************************************
%*****************************End Function********************************
end
%**************************************************************************
%**************************************************************************