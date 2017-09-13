function action(input, filename){
	open(input+filename);
	//run("Smooth");
	//run("Smooth");
	run("8-bit");
	run("Invert");
	run("Remove Outliers...", "radius=5 threshold=5 which=Bright");
	run("Remove Outliers...", "radius=5 threshold=5 which=Dark");
	run("Subtract Background...", "rolling=50");
	saveAs("PNG", input+filename);
	close();
}

input= "/Users/Desktop/background/new16x16/"; //change to custom filepath

setBatchMode(true);
list = getFileList(input);

for(i = 0; i<list.length; i++){
	action(input, list[i]);
}
setBatchMode(false);
