%% Fuzzy System Designed for Learning Process
% variable= rulelist.
%input= population of chromosms. each choromosome is a rulelist or rule
%       base
% design a fuzzy clasification for each rule base and classify examples
% then evalute CCR and number of not used rules for fitness function...
function [z,f11,f22,w11,w22,sysf]=sysfuzl(Pap,rulelist,inp,classF)
%%
Le=length(Pap(:,1));

a1=newfis('tro1','mamdani','min','max','min',...
    'max','centroid');
a1 = addvar(a1,'input','R',[0 255]);
a1 = addvar(a1,'input','G',[0 255]);
a1 = addvar(a1,'input','B',[0 255]);
a1 = addvar(a1,'output','class',[0 6]);

a1=addmf(a1,'output',1,'class','trapmf',[0 0 0.2 0.6]);
a1=addmf(a1,'output',1,'class','trapmf',[0.4 0.8 1.2 1.6]);
a1=addmf(a1,'output',1,'class','trapmf',[1.4 1.8 2.2 2.6]);
a1=addmf(a1,'output',1,'class','trapmf',[2.4 2.8 3.2 3.6]);
a1=addmf(a1,'output',1,'class','trapmf',[3.4 3.8 4.2 4.6]);
a1=addmf(a1,'output',1,'class','trapmf',[4.4 4.8 6 6]);

a1 = addmf(a1,'input',1,'VD','trapmf',[0 0 42 84]);
a1 = addmf(a1,'input',1,'D','trapmf',[42 84 84 126]);
a1 = addmf(a1,'input',1,'M','trapmf',[84 126 126 168]);
a1 = addmf(a1,'input',1,'B','trapmf',[126 168 168 210]);
a1 = addmf(a1,'input',1,'VB','trapmf',[168 210 255 255]);

a1 = addmf(a1,'input',2,'VD','trapmf',[0 0 42 84]);
a1 = addmf(a1,'input',2,'D','trapmf',[42 84 84 126]);
a1 = addmf(a1,'input',2,'M','trapmf',[84 126 126 168]);
a1 = addmf(a1,'input',2,'B','trapmf',[126 168 168 210]);
a1 = addmf(a1,'input',2,'VB','trapmf',[168 210 255 255]);

a1 = addmf(a1,'input',3,'VD','trapmf',[0 0 42 84]);
a1 = addmf(a1,'input',3,'D','trapmf',[42 84 84 126]);
a1 = addmf(a1,'input',3,'M','trapmf',[84 126 126 168]);
a1 = addmf(a1,'input',3,'B','trapmf',[126 168 168 210]);
a1 = addmf(a1,'input',3,'VB','trapmf',[168 210 255 255]);

rulel=zeros(125,6);
rulel(:,1:3)=rulelist;
rulel(:,5:6)=1;

sysf=zeros(500,100);
for i=1:Le
    rulel(:,4)=Pap(i,:)+1;
    a1=addrule(a1,rulel);
    sysf(:,i) = evalfis(inp,a1);
    a1.rule=[];
end

CCR=zeros(100,1);
%Evaluate CCR for Each Cromosom
for i=1:500
    for r=1:100
        if (round(sysf(i,r))==classF(i))
            CCR(r)=CCR(r)+1;
        end
    end
end
NUR=zeros(100);
for i=1:100
    for j=1:125
        if Pap(i,j)==0
            NUR(i)=NUR(i)+1;
        end
    end
end

f1=CCR(:,1)./500;
f2=NUR(:,1);

w1=1/(max(f1(:,1))- min(f1(:,1)));
w2=1/(max(f2(:,1))-min(f2(:,1)));
z=w1*f1+w2*f2;
f11=f1;
f22=f2;
w11=w1;
w22=w2;

end
