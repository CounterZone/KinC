 function bg=get_bgnoise(filename)
bkg_dir="../data/backgroundNoise/";
tind=regexp(filename,'T[0-9]');
t=str2num(filename(tind+1));
%filename="t"+num2str(t)+".tif";
Io2=imread(bkg_dir+filename);
Io2=rgb2gray(Io2);
bg=mean(mean(Io2));
end
