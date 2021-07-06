 function sig=get_segmentation()
bkg_dir="../data/bkg/";
gfp_dir="../data/gfp/";
ana_dir="../data/segment/";
files=dir(gfp_dir+"*.tif");
files={files.name};
for i = 1:length(files)
filename=files{i};
Io2=imread(bkg_dir+filename);
itap2=imread(gfp_dir+filename);
Io2=rgb2gray(Io2);
Io2=imresize(Io2,[512,672]);
itap2=rgb2gray(itap2);
itap2=imresize(itap2,[512,672]);
h = fspecial('log',5,0.28);
io2 = imfilter(Io2,h,'replicate');
bw= im2bw(io2,graythresh(io2));
conn= bwconncomp(bw,4);
cc=conn.PixelIdxList;
c={};
for i =1:length(cc)
    if (length(cc{i})>50 && length(cc{i})<180)
        s=std(double(itap2(cc{i})));
        if s<30
        c{end+1}=cc{i};
        end
    end
end
conn.PixelIdxList=c;
conn.NumObjects=length(c);
L=labelmatrix(conn);
label=label2rgb(L,'jet','k','shuffle');
imwrite(label,ana_dir+filename);
end
