%% Read Learning Images Function
function [inpF,classF,rulelist]=imageread()
%% NOTICE: activate this cell for read images from folder if you want
%Read Images

%pathname = 'E:\data\';
%dirlist = dir( [pathname '*.jpg'] );
%for x = 1:length(dirlist)
%    p(x).x=imread([pathname dirlist(x).name]);
%end
%im=cell(length(dirlist),1,3);
%% NOTICE:activate this cell for generate random 10x10 images IF YOU WANT
% Segmentation Images to 10*10 Pixels Images Randomly
%for i=1:length(dirlist)
%    for j=1:1
%        rax=randi([10,100]);
%        ray=randi([10,100]);
%        im(i,j,1)={p(i).x(rax-9:rax,ray-9:ray,1)};
%        im(i,j,2)={p(i).x(rax-9:rax,ray-9:ray,2)};
%        im(i,j,3)={p(i).x(rax-9:rax,ray-9:ray,3)};
%    end
%end
%% NOTICE:If you active above two cells please active this cell too
%Specify Images Class 
%In supevised learning class of images are verified
%imclass=zeros(length(dirlist),1);
%for i=1:length(dirlist)
%    for j=1:1
%        if(regexpi(dirlist(i).name,'c1')~=0)
%            imclass(i,j)=1;
%        elseif(regexpi(dirlist(i).name,'c2')~=0)
%            imclass(i,j)=2;
%        elseif(regexpi(dirlist(i).name,'c3')~=0)
%            imclass(i,j)=3;
%        elseif(regexpi(dirlist(i).name,'c4')~=0)
%            imclass(i,j)=4;
%        else
%            imclass(i,j)=5;
%        end
%    end
%end
%% NOTICE: if activate above cells please deactive code lines in this cell
load('imclass.mat');
load('im.mat');
im=im;
imclass=imclass;
%% Read Images in Correct Format of Program 
rowt=0;
inp=zeros(500,3);
for i=1:5
    for j=1:1
        for k=1:10
            for kk=1:10
                rowt=rowt+1;
                inp(rowt,:)=[im{i,j,1}(k,kk),im{i,j,2}(k,kk),im{i,j,3}(k,kk)];
                classimF(rowt,1)=imclass(i,j);
            end
        end
    end
end
%% Create First Version of Rule list\
% contain input data in an 3*125 elements array 
for i=1:125
    if(i<=25)
        rulelist(i,1)=1;
    elseif (i<=50)
        rulelist(i,1)=2;
    elseif (i<=75)
        rulelist(i,1)=3;
    elseif (i<=100)
        rulelist(i,1)=4;
    else
        rulelist(i,1)=5;
    end
    if(rem(i,5)==1)
        rulelist(i,3)=1;
    elseif(rem(i,5)==2)
        rulelist(i,3)=2;
    elseif(rem(i,5)==3)
        rulelist(i,3)=3;
    elseif(rem(i,5)==4)
        rulelist(i,3)=4;
    else
        rulelist(i,3)=5;
    end
    if(rem(i,25)==1)||(rem(i,25)==2)||(rem(i,25)==3)||(rem(i,25)==4)||(rem(i,25)==5)
        rulelist(i,2)=1;
    elseif(rem(i,25)==6)||(rem(i,25)==7)||(rem(i,25)==8)||(rem(i,25)==9)||(rem(i,25)==10)
        rulelist(i,2)=2;
    elseif(rem(i,25)==11)||(rem(i,25)==12)||(rem(i,25)==13)||(rem(i,25)==14)||(rem(i,25)==15)
        rulelist(i,2)=3;
    elseif(rem(i,25)==16)||(rem(i,25)==17)||(rem(i,25)==18)||(rem(i,25)==19)||(rem(i,25)==20)
        rulelist(i,2)=4;
    else
        rulelist(i,2)=5;
    end
end
%%
classF=classimF;
inpF=inp;
end

