#!/bin/bash

#SBATCH -A trn040
#SBATCH -J train_model
#SBATCH -o sbatch_logs/%x-%j.out
#SBATCH -e sbatch_logs/%x-%j.err
#SBATCH -t 12:00:00
#SBATCH -N 1

# Only necessary if submitting like: sbatch --export=NONE ... (recommended)
# Do NOT include this line when submitting without --export=NONE
unset SLURM_EXPORT_ENV

# Load software and activate environments
module load PrgEnv-gnu/8.6.0
module load miniforge3/23.11.0
module load rocm/6.2.4
module load craype-accel-amd-gfx90a
source activate /gpfs/wolf2/olcf/trn040/scratch/jyoder5/envs/hf-transformers

# Ensure we are running in the desired working directory
working_dir="/gpfs/wolf2/olcf/trn040/scratch/jyoder5/finetune_hw"
cd "${working_dir}"

# Output some useful logging info
echo "Running on node: $(hostname)"
echo "Python3 executable path: $(which python3)"
echo "Current working directory: $(pwd)"

# Run the text classification script
python3 train_model.py