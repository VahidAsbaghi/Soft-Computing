%% Fuzzy Syztem Implemetation in Tuning Process
% variables = input memebership Functions parameters
% input = rulelist that generated from learning process
% input = input images and classes for classify
% output= cerrect classification rate (CCR)
function [outp,ccr]=fuzzysys(inp,P,ruletar,classF,rulelist)

a=newfis('tro','mamdani','min','max','min',...  
 'max','centroid');

a = addvar(a,'input','R',[0 255]);
a = addvar(a,'input','G',[0 255]);
a = addvar(a,'input','B',[0 255]);
a = addvar(a,'output','class',[0 6]);

a=addmf(a,'output',1,'class','trapmf',[0 0 0.2 0.6]);
a=addmf(a,'output',1,'class','trapmf',[0.4 0.8 1.2 1.6]);
a=addmf(a,'output',1,'class','trapmf',[1.4 1.8 2.2 2.6]);
a=addmf(a,'output',1,'class','trapmf',[2.4 2.8 3.2 3.6]);
a=addmf(a,'output',1,'class','trapmf',[3.4 3.8 4.2 4.6]);
a=addmf(a,'output',1,'class','trapmf',[4.4 4.8 6 6]);

rulel=zeros(125,6);
rulel(:,1:3)=rulelist;
rulel(:,5:6)=1;
for i=1:125
    rulel(i,4)=ruletar(1,i)+1;
end
a=addrule(a,rulel);

out=zeros(500,100);
for i=1:length(P(:,1))
    a = addmf(a,'input',1,'VD','trapmf',[P(i,1) P(i,2) P(i,3) P(i,4)]);
    a = addmf(a,'input',1,'D','trapmf',[P(i,5) P(i,6) P(i,7) P(i,8)]);
    a = addmf(a,'input',1,'M','trapmf',[P(i,9) P(i,10) P(i,11) P(i,12)]);
    a = addmf(a,'input',1,'B','trapmf',[P(i,13) P(i,14) P(i,15) P(i,16)]);
    a = addmf(a,'input',1,'VB','trapmf',[P(i,17) P(i,18) P(i,19) P(i,20)]);
    
    a = addmf(a,'input',2,'VD','trapmf',[P(i,21) P(i,22) P(i,23) P(i,24)]);
    a = addmf(a,'input',2,'D','trapmf',[P(i,25) P(i,26) P(i,27) P(i,28)]);
    a = addmf(a,'input',2,'M','trapmf',[P(i,29) P(i,30) P(i,31) P(i,32)]);
    a = addmf(a,'input',2,'B','trapmf',[P(i,33) P(i,34) P(i,35) P(i,36)]);
    a = addmf(a,'input',2,'VB','trapmf',[P(i,37) P(i,38) P(i,39) P(i,40)]);
    
    a = addmf(a,'input',3,'VD','trapmf',[P(i,41) P(i,42) P(i,43) P(i,44)]);
    a = addmf(a,'input',3,'D','trapmf',[P(i,45) P(i,46) P(i,47) P(i,48)]);
    a = addmf(a,'input',3,'M','trapmf',[P(i,49) P(i,50) P(i,51) P(i,52)]);
    a = addmf(a,'input',3,'B','trapmf',[P(i,53) P(i,54) P(i,55) P(i,56)]);
    a = addmf(a,'input',3,'VB','trapmf',[P(i,57) P(i,58) P(i,59) P(i,60)]);
    
    
    out(:,i) = evalfis(inp,a);
    a.input(1,1).mf=[];
    a.input(1,2).mf=[];
    a.input(1,3).mf=[];
end
outp=out;
CCR=zeros(20,1);
%Evaluate CCR for Each Cromosom
for i=1:500
    for r=1:20
        if (round(outp(i,r))==classF(i))
            CCR(r)=CCR(r)+1;
        end
    end
end
ccr=CCR./500;
a.rule=[];
end