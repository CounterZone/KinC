clf;
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];
msggwtiig=[0,0,0,19.80,37.39,42.53];msggwtiigerr=[0, 0, 0, 1.80, 14.53, 19.66];
msggdaiig=[0,0,0,0.62,0.74,0.97];msggdaiigerr=[0, 0, 0, 0.43, 0.10, 0.13];
msggdciig=[0,0,0,64.86,115.37,174.55];msggdciigerr=[0, 0, 0, 14.83, 10.26, 16.72];
ts=[3,4,5,6,7,8];
para=[0.828,2.667,9.876,4423,7149,1,0.2];
va=4;vc=2.7;
%      para=ans;
temp = num2cell(para);
[nt,kg,kt,scaleg,scalet,vs,p0e] = deal(temp{:});

tt=3:0.1:9;
wts=[];
das=[];
dcs=[];
for t=tt
gr=gr_t(t);
wts=[wts fss_fit([11],gr,va,vc,vs,kg,kt,nt,p0e)];
das=[das fss_fit([11],gr,0,vc,vs,kg,kt,nt,p0e)];
dcs=[dcs fss_fit([11],gr,va,0,vs,kg,kt,nt,p0e)];
end
%%
nt1=1.1478;nt2=8;k1=1.51;k2=1.66;
k=557;
fTapA2=@(ap,k1,k2)ap.^nt1./(ap.^nt1+k1.^nt1).*k2.^nt2./(ap.^nt2+k2.^nt2);
errorbar(ts,msggwttap,msggwttaperr,'k','LineWidth',1,'LineStyle','none');hold on;

wt=plot(ts,msggwttap,'ko','MarkerSize',10,'MarkerFaceColor','white'); hold on ;
wtsim=fTapA2(wts,k1,k2).*fglobal(gr_t(tt),0.8)./(1+gr_t(tt))*k;
plot(tt,wtsim,'k-');
hold on;
errorbar(ts,msggdctap,msggdctaperr,'r','LineWidth',1,'LineStyle','none');hold on;

dc=plot(ts,msggdctap,'rs','MarkerSize',10,'MarkerFaceColor','white'); hold on ;
dcsim=fTapA2(dcs,k1,k2).*fglobal(gr_t(tt),0.8)./(1+gr_t(tt))*k;

plot(tt,dcsim,'r-');
hold on;
xlim([3,8]);ylim([0,500]);
legend([wt,dc],'wt','dkinC');
xlabel('time(h)');
ylabel('tapA promoter activity');
