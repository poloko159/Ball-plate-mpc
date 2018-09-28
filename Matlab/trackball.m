<<<<<<< HEAD
function [img, bw,aa,bb] = trackball(img, thresh)
% TRACKBALL

%% Extract RGB color components
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);     
aa = 0;
bb = 0;
SE = strel('rectangle',[7 7]);


%% Calculate green
justGreen = g - r/2 - b/2;

%% Threshold the image
bw = justGreen > thresh;

%% Find center
[x, y] = find(bw);
if ~isempty(x) && ~isempty(y)
    xm = round(mean(x));
    ym = round(mean(y));
    
    %% Creat a red dot
    xx = max(1, xm-5):min(xm+5, size(bw, 1));
    yy = max(1, ym-5):min(ym+5, size(bw, 2));
    bwbw = zeros(size(bw), 'uint8');
    bwbw(xx, yy) = 255;
    bb = -xm+240/2;
    aa = ym-320/2;
    %% Create output image
    img(:,:,1) = uint8(r + bwbw);
    img(:,:,2) = uint8(g - bwbw);
    img(:,:,3) = uint8(b - bwbw);
end

=======
function [img, bw,aa,bb] = trackball(img, thresh)
% TRACKBALL

%% Extract RGB color components
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);     
aa = 0;
bb = 0;
SE = strel('rectangle',[7 7]);


%% Calculate green
justGreen = g - r/2 - b/2;

%% Threshold the image
bw = justGreen > thresh;

%% Find center
[x, y] = find(bw);
if ~isempty(x) && ~isempty(y)
    xm = round(mean(x));
    ym = round(mean(y));
    
    %% Creat a red dot
    xx = max(1, xm-5):min(xm+5, size(bw, 1));
    yy = max(1, ym-5):min(ym+5, size(bw, 2));
    bwbw = zeros(size(bw), 'uint8');
    bwbw(xx, yy) = 255;
    bb = -xm+240/2;
    aa = ym-320/2;
    %% Create output image
    img(:,:,1) = uint8(r + bwbw);
    img(:,:,2) = uint8(g - bwbw);
    img(:,:,3) = uint8(b - bwbw);
end

>>>>>>> fde0ffbf156e966581cdd966662bb9d461e3685d
