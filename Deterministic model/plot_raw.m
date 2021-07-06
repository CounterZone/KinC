set(0, 'DefaultLineLineWidth', 1);
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];
msggwtiig=[0,0,0,19.80,37.39,42.53];msggwtiigerr=[0, 0, 0, 1.80, 14.53, 19.66];
msggdaiig=[0,0,0,0.62,0.74,0.97];msggdaiigerr=[0, 0, 0, 0.43, 0.10, 0.13];
msggdciig=[0,0,0,64.86,115.37,174.55];msggdciigerr=[0, 0, 0, 14.83, 10.26, 16.72];
ts=[3,4,5,6,7,8];
k=800;
errorbar(ts,msggwtiig,msggwtiigerr,'k','LineWidth',1);hold on;
wt=plot(ts,msggwtiig,'-ok','MarkerSize',10,'MarkerFaceColor','white');
hold on;
errorbar(ts,msggdciig,msggdciigerr,'r','LineWidth',1);hold on;
dc=plot(ts,msggdciig,'rs-','MarkerSize',10,'MarkerFaceColor','white');
hold on;
errorbar(ts,msggdaiig,msggdaiigerr,'b','LineWidth',1);hold on;
da=plot(ts,msggdaiig,'bd-','MarkerSize',10,'MarkerFaceColor','white');

xlim([3,8]);
legend([wt,dc,da],'wt','¦¤kinC','¦¤kinA');
xlabel('time(h)');
ylabel('SpoIIG promoter activity');

figure;
errorbar(ts,msggwttap,msggwttaperr,'k','LineWidth',1);hold on;
wt=plot(ts,msggwttap,'ko-','MarkerSize',10,'MarkerFaceColor','white');hold on;
errorbar(ts,msggdctap,msggdctaperr,'r','LineWidth',1);hold on;
dc=plot(ts,msggdctap,'rs-','MarkerSize',10,'MarkerFaceColor','white');hold on;
errorbar(ts,msggdatap,msggdataperr,'b','LineWidth',1);hold on;
da=plot(ts,msggdatap,'bd-','MarkerSize',10,'MarkerFaceColor','white');
xlim([3,8]);ylim([0,500]);
legend([wt,dc,da],'wt','¦¤kinC','¦¤kinA');
xlabel('time(h)');
ylabel('tapA promoter activity');



%%
sporemsgg=[ 194833 2955 12583333 0 0 328250000 185250  229000000];
errmsgg=[96410	1592	10414493 0 0 75433746 34326 23508864];

errlow=log10(sporemsgg)-log10(sporemsgg-errmsgg);
errhigh=log10(sporemsgg+errmsgg)-log10(sporemsgg);

bar(log10(sporemsgg))  
hold on;
er = errorbar(1:8,log10(sporemsgg),errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylim([2 10])
ylabel('Spore counts')

%%
ikinA=[194.29	431.28	540.68	995.77	1279.32	1328.91];
wt=plot(ts,msggwttap,'ko-');
hold on;
ia=plot(ts,ikinA,'bd-','MarkerSize',10);
hold on;
xlabel('time(h)');
ylabel('tapA promoter activity(MU)');
legend([wt,ia],'wt','kinA-induced');
%%
msggdcdstap=[83, 200, 324, 777, 1302, 1405];
msggdstap=[165, 286, 376, 800, 1130, 1192];
wt=plot(ts,msggwttap,'-ok','MarkerSize',10);
hold on;
dc=plot(ts,msggdctap,'rs-','MarkerSize',10);
hold on;
ds=plot(ts,msggdstap,'ko--','MarkerSize',10);
xlim([3,8]);
dcds=plot(ts,msggdcdstap,'rs--','MarkerSize',10);
legend([wt,dc,ds,dcds],'wt','¦¤kinC','¦¤sda','¦¤kinC¦¤sda');
xlabel('time(h)')
ylabel('tapA promoter activity (MU)')