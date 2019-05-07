%% Mutation Function for Fuzzy System Tuning
% one gene value in selected chromosomes of roulete wheel process replace.
% each gene select randomly and generate random number in respect to 
% boundary condition said in page four of article
function muoutF=mutatF(Pap)
%%
PaptF=Pap;
muouttF=zeros(length(Pap(:,1)),60);
for i=1:length(Pap(:,1))
    j=i;
    k1=round((randi([10,600]))/10);
    if (rem(k1,4)==1)
        tt=(Pap(i,k1)-(Pap(i,k1+1)-Pap(i,k1))/2)+((Pap(i,k1)+(Pap(i,k1+1)-Pap(i,k1))/2)-(Pap(i,k1)-(Pap(i,k1+1)-Pap(i,k1))/2)).*rand(1);
    elseif (rem(k1,4)==2)
        tt=(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)+((Pap(i,k1)+(Pap(i,k1+1)-Pap(i,k1))/2)-(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)).*rand(1);
    elseif (rem(k1,4)==3)
        tt=(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)+((Pap(i,k1)+(Pap(i,k1+1)-Pap(i,k1))/2)-(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)).*rand(1);
    else
        tt=(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)+((Pap(i,k1)+(Pap(i,k1)-Pap(i,k1-1))/2)-(Pap(i,k1)-(Pap(i,k1)-Pap(i,k1-1))/2)).*rand(1);
    end    
    
    PaptF(j,k1)=tt;
    muouttF(i,:)=PaptF(j,:);
end
muoutF=muouttF;
end