
%add path for vbb tool box.
addpath(genpath('.\tools\code3.2.0'));
savepath;


%add path for vbb tool box.
addpath(genpath('.\tools\piotr_toolbox\toolbox'));
savepath;



image_dir = 'C:/Jianfeng/OpenCV/CVRD/TSR/data/VIP_DATA/images';
base_name = 'vip_front_day_';
width = 864;
height = 480;


dirData = dir([image_dir,'/*.jpg']);         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names
frame_no = numel(fileNames);

% read all images under the directory and change the name as base name
% for iFile = 1:frame_no  %# Loop over the file names
%   newName = sprintf([base_name,'%05d.jpg'],iFile);  %# Make the new name
%   movefile([image_dir,'\',fileNames{iFile}],[image_dir,'\',newName]);        %# Rename the file
% end


%% create the seqence file from the images in one directory.

%the generated video seqence information
image_width = width;
image_height = height;
fps = 30;
quality = 100; %the value is between 0 and 100.

out_seq_file =[base_name '.seq'];
f0 = 1;%start frame number;
f1 = frame_no; %the end frame number;

createSeq(image_width,image_height,fps,quality,image_dir,base_name,f0,f1,out_seq_file);