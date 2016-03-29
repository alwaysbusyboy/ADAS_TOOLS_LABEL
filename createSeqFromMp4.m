raw_video_path = '.\data\videos';
seq_video_path = '.\data\seq';

%add the path for seqIO lib
addpath(genpath('.\tools\piotr_toolbox\toolbox'));
savepath;

%add path for vbb tool box.
addpath(genpath('.\tools\code3.2.0'));
savepath;


video_files = sprintf('%s\\*.mp4',raw_video_path);
raw_videos= dir(video_files);

for i=1:length(raw_videos)    
    filename = raw_videos(i).name;
    [pathstr,name,ext] = fileparts(filename);
    fprintf(1,'convert video sequence %s\n',filename);
    video_name=sprintf('%s\\%s%s',raw_video_path,name,ext);
    seq_name=sprintf('%s\\%s.seq',seq_video_path,name);
    
    vid = VideoReader(video_name);
    numFrames = vid.NumberOfFrames;
    height = vid.Height;
    width = vid.Width;
    fps =  vid.FrameRate;
    quality = 100;
    
    info = struct('width',width,'height',height,'fps',fps,'quality',quality,'codec','png');
    sw = seqIo(seq_name, 'writer', info );   
    tid = ticStatus('create video sequence usage',.2,1);
    for f=1:10:numFrames %skip every 10 frames.
        frames = read(vid,f);
        sw.addframe(read(vid,f)); 
        tocStatus(tid,f/numFrames); 
    end
    sw.close();
    fprintf(1,'done with createSeqence %s\n',seq_name);
end





 
