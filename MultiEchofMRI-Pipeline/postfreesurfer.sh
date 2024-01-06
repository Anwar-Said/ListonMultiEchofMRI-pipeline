 
EnvironmentScript="/isis/home/saida2/projects/Conorpipeline/HCPpipelines/Examples/Scripts/SetUpHCPPipeline.sh" # Pipeline environment script; users need to set this 
source ${EnvironmentScript}	#  
 #define some input variables for "Post" FreeSurfer;
SurfaceAtlasDIR="${HCPPIPEDIR_Templates}/standard_mesh_atlases"
GrayordinatesSpaceDIR="${HCPPIPEDIR_Templates}/91282_Greyordinates"
GrayordinatesResolutions="2" #Usually 2mm, if multiple delimit with @, must already exist in templates dir
HighResMesh="164" #Usually 164k vertices
LowResMeshes="32" #Usually 32k vertices, if multiple delimit with @, must already exist in templates dir
SubcorticalGrayLabels="${HCPPIPEDIR_Config}/FreeSurferSubcorticalLabelTableLut.txt"
FreeSurferLabels="${HCPPIPEDIR_Config}/FreeSurferAllLut.txt"
ReferenceMyelinMaps="${HCPPIPEDIR_Templates}/standard_mesh_atlases/Conte69.MyelinMap_BC.164k_fs_LR.dscalar.nii"

RegName="MSMSulc" #MSMSulc is recommended, if binary is not available use FS (FreeSurfer)
# RegName="FS"
echo -e "Running PostFreeSurferPipeline" 
StudyFolder=$1 # location of Subject folder
Subject=$2 


# run the Post FreeSurfer pipeline;
${HCPPIPEDIR}/PostFreeSurfer/PostFreeSurferPipeline.sh \
--path="$StudyFolder" \
--subject="$Subject" \
--surfatlasdir="$SurfaceAtlasDIR" \
--grayordinatesdir="$GrayordinatesSpaceDIR" \
--grayordinatesres="$GrayordinatesResolutions" \
--hiresmesh="$HighResMesh" \
--lowresmesh="$LowResMeshes" \
--subcortgraylabels="$SubcorticalGrayLabels" \
--freesurferlabels="$FreeSurferLabels" \
--refmyelinmaps="$ReferenceMyelinMaps" \
--regname="$RegName" \
--processing-mode="$ProcessingMode" > ${StudyFolder}/${Subject}/qa/PostFreeSurfer.txt
