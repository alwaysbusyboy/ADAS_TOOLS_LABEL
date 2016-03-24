



input_video_dir = '';

%list all mp4 videos
name=sprintf('%s\\*.mp4',input_video_dir);
list1=dir(name);

s=1;
e=length(list1);
for i=s:e
    filename = list1(i).name;
    [pathstr,name,ext] = fileparts(filename);
    fprintf(1,'extract the frames from %s\n',filename);
    
    %create the directory to save the images. 
    image_folder_name=sprintf('%s\\images\\%s',input_video_dir,name);
    if (~exist(image_folder_name,'dir'))    
        mkdir(image_folder_name);
    end
    
    %read the frames from video
    vid=mmreader([input_video_dir,'\',filename]);
    numFrames = vid.NumberOfFrames;
    height = vid.Height;
    width = vid.Width;
    n=numFrames;
 
    frame_number = 1; 
    %alway save the first frame for each video
    prev_frame = read(vid,1);
    vStr = num2str(frame_number, '%05d'); 
    imwrite(prev_frame,[image_folder_name '\' name '_' vStr '.jpg']);
    frame_number=frame_number+1;
    for i = 2:1:n
         frame = read(vid,i);
         diff = abs(frame(:,:,1)-prev_frame(:,:,1));
         diff_sum = sum(sum(diff));
         threshold = 20*width*height;
         if(diff_sum>threshold) || mod(i,10)==0      
             vStr = num2str(frame_number, '%05d'); 
             imwrite(frame,[image_folder_name '\' name '_' vStr '.jpg']);
             frame_number=frame_number+1; 
             prev_frame = frame;
         end        
    end 
  fprintf('done with %s\n',filename);
end