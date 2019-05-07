function plotss=PlotMFs(plotpop,CCR)
aa=newfis('tro2','mamdani','min','max','min',...
    'max','centroid');

plotss=1;

P=plotpop;
i=1;
aa = addvar(aa,'input','Red',[0 255]);
aa = addvar(aa,'input','Green',[0 255]);
aa = addvar(aa,'input','Blue',[0 255]);

aa = addmf(aa,'input',1,'VD','trapmf',[P(i,1) P(i,2) P(i,3) P(i,4)]);
aa = addmf(aa,'input',1,'D','trapmf',[P(i,5) P(i,6) P(i,7) P(i,8)]);
aa = addmf(aa,'input',1,'M','trapmf',[P(i,9) P(i,10) P(i,11) P(i,12)]);
aa = addmf(aa,'input',1,'B','trapmf',[P(i,13) P(i,14) P(i,15) P(i,16)]);
aa = addmf(aa,'input',1,'VB','trapmf',[P(i,17) P(i,18) P(i,19) P(i,20)]);

aa = addmf(aa,'input',2,'VD','trapmf',[P(i,21) P(i,22) P(i,23) P(i,24)]);
aa = addmf(aa,'input',2,'D','trapmf',[P(i,25) P(i,26) P(i,27) P(i,28)]);
aa = addmf(aa,'input',2,'M','trapmf',[P(i,29) P(i,30) P(i,31) P(i,32)]);
aa = addmf(aa,'input',2,'B','trapmf',[P(i,33) P(i,34) P(i,35) P(i,36)]);
aa = addmf(aa,'input',2,'VB','trapmf',[P(i,37) P(i,38) P(i,39) P(i,40)]);

aa = addmf(aa,'input',3,'VD','trapmf',[P(i,41) P(i,42) P(i,43) P(i,44)]);
aa = addmf(aa,'input',3,'D','trapmf',[P(i,45) P(i,46) P(i,47) P(i,48)]);
aa = addmf(aa,'input',3,'M','trapmf',[P(i,49) P(i,50) P(i,51) P(i,52)]);
aa = addmf(aa,'input',3,'B','trapmf',[P(i,53) P(i,54) P(i,55) P(i,56)]);
aa = addmf(aa,'input',3,'VB','trapmf',[P(i,57) P(i,58) P(i,59) P(i,60)]);

strr=num2str(CCR);
figure;plotmf(aa,'input',1); 
figure;plotmf(aa,'input',2);
figure;plotmf(aa,'input',3);title(['Max CCR=' strr]); 
end