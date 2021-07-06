function g = get_pixel_dist(strain,time)
bkg_dir="../data/refined/";
gfp_dir="../data/backgroundNoise/";
ana_dir="../data/analysis/";
files=dir("../data/refined/*.tif");
files={files.name};
signal=struct; % strain: signals (list)
signal(1).wt={};
signal(1).dc={};
signal(1).da={};
strain_map=containers.Map({'8771','8955','8957'},{'wt','da','dc'});

for i = 1:length(files)
    filename=files{i};
background=0;
    

itap2=imread(gfp_dir+filename);
itap2=rgb2gray(itap2)-background;
itap2=max(itap2,0);
itap2=reshape(itap2,1,[]);
tind=regexp(filename,'T[0-9]');
t=str2num(filename(tind+1));
strain=filename(1:4);
strain=strain_map(strain);

if length(signal(1).(strain))<t
    signal(1).(strain){t}=[];
    area(1).(strain){t}=[];
end
signal(1).(strain){t}=[signal(1).(strain){t} itap2];
end

ts=[4,6,8];
for t=ts
    for strain=["wt","dc"]
        sig1s=signal.(strain){t};
        histogram(sig1s,'BinEdges',linspace(0,10,30), 'FaceAlpha',0.5,'Normalization','probability');
        ylim([0,0.4]);
        title(strain+'T'+num2str(t));
        pbaspect([2,1,1]);
        set(gca,'fontsize',14);
        saveas(gcf,ana_dir+"pixels_"+strain+'T'+num2str(t)+'.png');
        clf;
    end
end
g=(var(double(signal.(strain){time}))*100)^0.5/100;
end

