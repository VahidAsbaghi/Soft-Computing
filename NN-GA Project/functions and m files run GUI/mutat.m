function mupop=mutat(crospop,Pm)
%% ********************Genetic Mutation Process****************************

% mutation is done by:
% 1- for each individuals generate a random number in (0,1] namely 'ra'  
% 2- if for a choromosome 'ra'<Pm then
% 3- 5% of choromosome's genes selected randomly and replace by new value
% new value is the "old gene's value" + "a random double in [-0.05 0.05]" 

%% ************************************************************************

[len,len1]=size(crospop);
len2=round(5*(len1-1)/100);
R=0.05;
for i=1:len
    ra=randi([1 1000])/1000;
    if (ra<Pm)
        ra1=randperm(len1-1);
        ra2=ra1(1:len2);
        for k=1:len2
            crospop(i,ra2(k))=crospop(i,ra2(k))+randi([-R*1000 R*1000])/1000;
        end
        crospop(i,len1)=0;
    end    
end
mupop=crospop;

%**************************************************************************
%********************************End Function******************************
end
%**************************************************************************
%**************************************************************************