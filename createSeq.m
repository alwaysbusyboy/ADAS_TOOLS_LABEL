%create the seqence file

function createSeq(image_width,image_height,fps,quality,directory_path,base_name,f0,f1,out_seq_file)
 info = struct('width',image_width,'height',image_height,'fps',fps,'quality',quality,'codec','jpg');
%info = struct('fps',fps,'quality',quality,'codec','jpg');
input_para = struct('sDir',directory_path,'name',base_name,'f0',f0,'f1',f1);
seqIo(out_seq_file, 'frImgs', info,input_para);
fprintf(1,'done with createSeqence\n');