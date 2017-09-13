//This program is made to run with Fiji2 ImageJ image analysis software.
//Created on July 2017
//It takes in a text file containing the image files that were classified as fiber by the machine learning algorithm and analyzes the percentage fiber that each image contains
//The results are outputted to a text file

function action2(input){
	open(input);
	run("8-bit");
	makeRectangle(5,2, 630, 475);
	run("Crop");
	run("Smooth");
	run("Smooth");
	run("Remove Outliers...", "radius=5 threshold=5 which=Dark");
	run("Remove Outliers...", "radius=5 threshold=5 which=Bright");
	setOption("BlackBackground", false);
	run("Make Binary");
	run("Remove Outliers...", "radius=5 threshold=5 which=Dark");
	run("Analyze Particles...", "clear summarize");
	close();
}

filestring = File.openAsString("/Users/KevinGao/Desktop/orange2imjTEST.csv");
lines=split(filestring, "\n");

input= "/Users/KevinGao/Desktop/fiber_clot/fiber/16x16/";
output = "/Users/KevinGao/Desktop/binaryTraining/";

setBatchMode(true);
list = getFileList(input);

for(i = 4; i<lines.length; i++){ //changed start value to 4; changed list to line
	action2(lines[i]);
}
setBatchMode(false);
saveAs("Results", "/Users/Desktop/percentages.tab"); //change to custom filepath

