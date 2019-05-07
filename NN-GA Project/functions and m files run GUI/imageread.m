function [T,input]=imageread()
%% ***************Input Reading and Provide Target Array*******************

% this function read twelve images in program format and provide target
% values to compare with outputs if needed

%% ************************************************************************

dirlist=dir('*.tif');%create a directory list of files with "tif" format 
len1=length(dirlist);
target=zeros(10,len1);
images=zeros(100,len1);
for i=1:len1
    %read images resize to 10*10 pixel size--convert to double and
    %normalize to [0,1] interval-- reshape to a vector 1*100 that is 
    %appropriate for input values-- and divide each pixel value to 8-- 
    images(:,i)=reshape(im2double(imresize(imread(dirlist(i).name),[10 10])),1,100)./8;
    if (regexp(dirlist(i).name,'1')~=0)
       target(1,i)=0;
      target(2,i)=1;
    elseif (regexp(dirlist(i).name,'2')~=0)
        target(1,i)=1;
       target(2,i)=0;
    else
      target(1,i)=1;
      target(2,i)=1;
    end
    if (regexp(dirlist(i).name,'up-up')~=0)
        target(3,i)=1;
    elseif (regexp(dirlist(i).name,'right-right')~=0)
        target(4,i)=1;
    elseif (regexp(dirlist(i).name,'down-down')~=0)
        target(5,i)=1;
    elseif (regexp(dirlist(i).name,'left-left')~=0)
        target(6,i)=1;
    elseif (regexp(dirlist(i).name,'up-right')~=0)
        target(7,i)=1;
    elseif (regexp(dirlist(i).name,'down-right')~=0)
        target(8,i)=1;
    elseif (regexp(dirlist(i).name,'down-left')~=0)
        target(9,i)=1;
    elseif (regexp(dirlist(i).name,'up-left')~=0)
        target(10,i)=1;
    end
end
T=target;
input=images;

%**************************************************************************
%******************************End Function********************************
end
%**************************************************************************
%**************************************************************************