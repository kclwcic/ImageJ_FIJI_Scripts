# ImageJ_FIJI_Scripts
some scripts for ImageJ

bgr to rgb is intended to convert the colour camera output nd2 files that NIS elements generates and convert them to a typical RGB format in FIJI

deinterlacechannels is to take a multi-tiff that hasn't got sorted channels (a stack with channels in a sequence as though it were just a stack) 
and convert it to a multichannel tiff in FIJI - this is useful for data exported from Columbus 

zmax_2chans_outputrgbtiff = input of nd2 files in a folder - open the files in folder, run zmax on them and split the 2 channels, then save them all.
