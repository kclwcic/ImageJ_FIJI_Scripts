orgid = getImageID();
chanval = getNumber("How Many Channels?", 1);
for(i=1;i<=chanval;i++){
	run("Make Substack...", "slices="+i+"-"+nSlices+"-"+chanval);
	selectImage(orgid);
}
mergestring= "";
mergechans = newArray(1,3,4,5,6); // the colours chosen for the merge step
mergesubs = newArray(4,1,2,3,5); // your unsorted stack came in a specific order of channels which you will want to set the order of for the above input chans
for(i=1;i<=chanval;i++){
	mergestring = mergestring +"c"+ mergechans[i-1] +"=[Substack (" + mergesubs[i-1] + "-" + nSlices + "-" + chanval +")] ";
}
//merge channels uses c1 for red, c2 for green, c3 for blue, c4 for grey, c5 for cyan, c6 for magenta, c7 for yellow - select the order in the mergechan variable on line 8
run("Merge Channels...", mergestring);
//run("Merge Channels...", "c1=[Substack (4-75-5)] c3=[Substack (1-75-5)] c4=[Substack (2-75-5)] c5=[Substack (3-75-5)] c6=[Substack (5-75-5)]");
// above is the literal option  - the values all need to match your data to work - remove the two // before that line to uncomment and use instead - also add the // to line 14 if you want to run the literal version