function interVal=interpImg(img,y,x)
% BiLinear interpolation using 4 pixels around the target location with ceil convention
y0=floor(y);
x0=floor(x);
wtx=x-x0;
wty=y-y0;
wtconjx=1-wtx;
wtconjy=1-wty;
interTop=wtconjx*pixLookup(img,y0,x0)+x*pixLookup(img,y0,x);
interBtm=wtconjx*pixLookup(img,y,x0)+x*pixLookup(img,y,x);
interVal=wtconjy*interTop+y*interBtm;
end


function pixVal=pixLookup(img,y,x)
[ROW,COL]=size(img);

   pixVal=img(ceil(y),ceil(x),:);

end