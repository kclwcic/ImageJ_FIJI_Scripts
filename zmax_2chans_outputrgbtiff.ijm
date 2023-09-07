// "BatchProcessFolders"
//


   requires("1.33s"); 
   dir = getDirectory("Choose a Directory ");
   setBatchMode(true);
   count = 0;
   countFiles(dir);
   n = 0;
   processFiles(dir);
   //print(count+" files processed");
   exit();
   function countFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              countFiles(""+dir+list[i]);
          else
              count++;
      }
  }

   function processFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              processFiles(""+dir+list[i]);
          else {
             showProgress(n++, count);
             path = dir+list[i];
             processFile(path);
          }
      }
  }

  function processFile(path) {
         if (endsWith(path, ".nd2")) {
           run("Bio-Formats", "open="+path + " color_mode=Default view=Hyperstack stack_order=XYCZT");
		   origid = getImageID;
		   run("Z Project...", "projection=[Max Intensity]");
		   zmaxid = getImageID;
		   selectImage(origid);
           close();
           selectImage(zmaxid);
           zmax_name = File.name;
           zmaxinfo = dir + File.nameWithoutExtension + "_max_projection";
           saveAs("tiff", zmaxinfo);
           zmax_name = File.nameWithoutExtension;
           run("Split Channels");
           selectImage(zmaxid-1);
           zmaxchan1 = dir + File.nameWithoutExtension + "_max_projection_Channel1";
           saveAs ("tiff", zmaxchan1);
           close();
           selectImage(zmaxid-2);
           zmaxchan2 = dir + File.nameWithoutExtension + "_max_projection_Channel2";
           saveAs ("tiff", zmaxchan2);
           close();
      }
  }