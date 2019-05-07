%% Mutation Function in Learning Process
%method: Random Reseting
%for all coromosoms selected in roulete wheel process do
%generate two random number for select two genes
%generate two random number for replace gene's value
function muout=mutat(Pap)
%%
Papt=Pap;
for i=1:length(Pap(:,1))
    j=i;%randi([1,length(Pap(:,1))]);
    k1=randi([1,125]);
    %k2=randi([1,125]);
    Papt(j,k1)=randi([0,5]);
    %Papt(j,k2)=randi([0,5]);
    muoutt(i,:)=Papt(j,:);
end
muout=muoutt;
end

