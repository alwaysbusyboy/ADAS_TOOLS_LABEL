function convert_video_seq(video_path_set,video_file)

%%% convert the video into frames.
input_video_dir = [video_path_set '\\videos'];
out_image_dir = [video_path_set '\\images'];
out_sequence_dir = [video_path_set '\\seq'];
%the video extension name
ext        = 'mp4';

%convert the video to frames
[frame_no,height,width] = convert_video_to_frames(input_video_dir,out_image_dir,video_file,ext);

%% create the seqence file from the images in one directory.

%the generated video seqence information
image_width = width;
image_height = height;
fps = 30;
quality = 100; %the value is between 0 and 100.

input_image_directory_for_seq= [out_image_dir '\\' video_file];
out_seq_file =[out_sequence_dir '\' video_file '.seq'];
base_name = [video_file '_']
f0 = 1;%start frame number;
f1 = frame_no; %the end frame number;

createSeq(image_width,image_height,fps,quality,input_image_directory_for_seq,base_name,f0,f1,out_seq_file);

