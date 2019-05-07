%% Crossover Function in Learning and Tuning Processes
% method: n-point crossover 
% generate 4 random number for specify cut place
% exchange cuted place of two cromosom and generate two new child
function crov=crosovr(Pap)
%%
Le=length(Pap(:,1));
len=length(Pap(1,:));
i=0;
while (i<Le)
    i=i+1;
    k1=i;
    i=i+1;
    k2=i;
    p1=randi([1,len],1,3);
    p1=sort(p1);
    newPap1=[Pap(k1,1:p1(1)) Pap(k2,p1(1)+1:p1(2)) Pap(k1,p1(2)+1:p1(3)) Pap(k2,p1(3)+1:len)];%p1(4)) Pap(k1,p1(4)+1:len)];
    newPap2=[Pap(k2,1:p1(1)) Pap(k1,p1(1)+1:p1(2)) Pap(k2,p1(2)+1:p1(3)) Pap(k1,p1(3)+1:len)];%p1(4)) Pap(k2,p1(4)+1:len)];
    
    Papt1(k1,:)=newPap1;    
    Papt1(k2,:)=newPap2;
end
crov=Papt1;
end
