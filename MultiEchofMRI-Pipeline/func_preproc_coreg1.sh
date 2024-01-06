#!/bin/bash
# CJL; (cjl2007@med.cornell.edu)

MEDIR=$1
Subject=$2
StudyFolder=$3
Subdir="$StudyFolder"/"$Subject"
SUBJECTS_DIR="$Subdir"/anat/T1w/ # note: this is used for "bbregister" calls;
AtlasTemplate=$4
DOF=$5
NTHREADS=$6
StartSession=$7

# first, lets read in all the .json files associated with each scan 
# & write out some .txt files that will be used during preprocessing

# fresh workspace dir.
# mkdir "$Subdir"/workspace/ > /dev/null 2>&1

# # create temp. make_precise_subcortical_labels.m 
# cp -rf "$MEDIR"/res0urces/make_precise_subcortical_labels.m \
# "$Subdir"/workspace/temp.m

# # define some Matlab variables;
# echo "addpath(genpath('${MEDIR}'))" | cat - "$Subdir"/workspace/temp.m > temp && mv temp "$Subdir"/workspace/temp.m
# echo Subdir=["'$Subdir'"] | cat - "$Subdir"/workspace/temp.m >> temp && mv temp "$Subdir"/workspace/temp.m > /dev/null 2>&1 		
# echo AtlasTemplate=["'$AtlasTemplate'"] | cat - "$Subdir"/workspace/temp.m >> temp && mv temp "$Subdir"/workspace/temp.m > /dev/null 2>&1 		
# echo SubcorticalLabels=["'$MEDIR/res0urces/FS/SubcorticalLabels.txt'"] | cat - "$Subdir"/workspace/temp.m >> temp && mv temp "$Subdir"/workspace/temp.m > /dev/null 2>&1 		
# cd "$Subdir"/workspace/ # run script via Matlab 
# # matlab -nodesktop -nosplash -r "temp; exit" > /dev/null 2>&1 
# echo "running matlab!"
# matlab -nodesktop -nosplash -r "temp; exit" 
# # delete some files;
# rm -rf "$Subdir"/workspace/
# cd "$Subdir" # go back to subject dir. 

# # finally, evaluate whether scan-specific or average field maps 
# # produce the best co-registeration / cross-scan allignment & 
# # then generate a movie summarizing the results 

# # fresh workspace dir.
# rm -rf "$Subdir"/workspace/ > /dev/null 2>&1
mkdir "$Subdir"/workspace/ > /dev/null 2>&1

# create temporary CoregQA.m 
cp -rf "$MEDIR"/res0urces/coreg_qa.m \
"$Subdir"/workspace/temp.m

# define some Matlab variables;
echo "addpath(genpath('${MEDIR}'))" | cat - "$Subdir"/workspace/temp.m > temp && mv temp "$Subdir"/workspace/temp.m
echo Subdir=["'$Subdir'"] | cat - "$Subdir"/workspace/temp.m >> temp && mv temp "$Subdir"/workspace/temp.m > /dev/null 2>&1 		
cd "$Subdir"/workspace/ # run script via Matlab 
# matlab -nodesktop -nosplash -r "temp; exit" > /dev/null 2>&1
echo -e "running matlab 2********************************************************"
matlab -nodesktop -nosplash -r "temp; exit" 
rm -rf "$Subdir"/workspace/ > /dev/null 2>&1
