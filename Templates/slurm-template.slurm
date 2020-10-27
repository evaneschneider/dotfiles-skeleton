#!/usr/bin/env bash
## This is a template for job submission scripts with the Slurm workload manager
## modify as needed. Submission is done like `sbatch <submission-file>`.
## SBATCH commands can be commented out with double ##, ie
## everything after the second # is considered a comment as far as Slurm is
## concerned.
## Slurm user guide: https://slurm.schedmd.com/sbatch.html

#SBATCH --job-name=<JOB NAME>      # Job name
#SBATCH --nodes=1                  # Number of nodes requested
##SBATCH --ntasks-per-node=1        # Number of tasks/threads/processes per node
#SBATCH --cluster=gpu              # mpi, gpu and smp are available in H2P
#SBATCH --partition=gtx1080        # Available: smp, high-mem, opa, gtx1080, titanx, k40
#SBATCH --gres=gpu:1               # Number of GPUs requested
#SBATCH --time=0-00:10:00          # Walltime in dd-hh:mm:ss format
##SBATCH --qos=long                 # required if walltime is greater than 3 days

#SBATCH --mail-user=YOUR EMAIL HERE  #send email to this address if ...
#SBATCH --mail-type=END,FAIL       # ... job ends or fails

module purge                       # Make sure the modules environment is sane
module load WHATEVER YOU NEED HERE

##### Setup all copying commands and paths #####################################
RSYNC="$(command -v rsync)"
rsync_flags=(
    -amh
    --stats
)

exe_path="/ihome/eschneider/rvc9/cholla"

input_files=(
    "${SLURM_SUBMIT_DIR/*}"
    "${exe_path}"
)
##output_files=(
##    "${SLURM_SCRATCH}/*.h5"
##)
################################################################################


echo -e "\n##### Copying files to local scratch ##########################################"
"${RSYNC}" "${rsync_flags[@]}" "${input_files[@]}" "${SLURM_SCRATCH}" # Copy inputs to scratch
cd $SLURM_SCRATCH
echo -e "##### Finished copying files to local scratch #################################"


# Set a trap to copy any temp files you may need
run_on_exit(){
    "${RSYNC}" "${rsync_flags[@]}" "${SLURM_SCRATCH}/" "${SLURM_SUBMIT_DIR}/slurm_trap"
}
trap run_on_exit EXIT


echo -e "\n##### Running Job #############################################################"
srun "${SLURM_SCRATCH}/EXECUTABLE HERE" "${SLURM_SCRATCH}/<PARAMETER FILENAME>" 1> executable.out 2> executable.err # Run the job
echo -e "##### Finished Running Job ####################################################"


echo -e "\n##### Job Stats ###############################################################"
crc-job-stats.py # gives stats of job, wall time, etc.
echo -e "##### End Job Stats  ##########################################################"

## Ignore this part for now since Cholla writes out all results to where I tell it to
##echo -e "\n##### Copying outputs back to submission directory  ###########################"
##"${RSYNC}" "${rsync_flags[@]}" "${output_paths[@]}" "${SLURM_SUBMIT_DIR}" # Copy outputs to submit directory
##echo -e "##### Finished copying outputs back to submission directory  ##################"
