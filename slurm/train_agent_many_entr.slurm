#!/bin/bash

# Set the number of nodes
#SBATCH --nodes=1

# set max wallclock time
#SBATCH --time=6-00:00:00

# set number of GPUs
#SBATCH --gres=gpu:1

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=END,FAIL

# send mail to this address
#SBATCH --mail-user=mpainter@robots.ox.ac.uk

# Use a small partition
#SBATCH --partition=small

# Some of the jade nodes are a bit buggy right now
#SBATCH --exclude=dgk713



HOME_DIR="/jmain02/home/J2AD008/wga37/mmp10-wga37"
CODE_DIR="/jmain02/home/J2AD008/wga37/mmp10-wga37/rl-baselines3-zoo-entropy-investigation"

WANDB_PROJECT_NAME="entropy-investigation"
WANDB_ENTITY="michaelpainter-1994"

echo Running experiment ${EXPR_ID}
echo " "

#https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash
IFS=';' read -ra ENTROPY_COEFFS_ARR <<< "${ENTROPY_COEFFS}"

cd $HOME_DIR
source setup_devel_shell.sh
conda activate rlzoo
cd $CODE_DIR
source setup_for_devel.sh
source setup_wandb_api_key.sh

wandb offline

for ENTROPY_COEFF in ${ENTROPY_COEFFS_ARR[@]}
do
    PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
    PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
    LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}/${ENTROPY_COEFF}
    mkdir -p ${LOG_DIR}
    TB_LOG_DIR=${LOG_DIR}/tb_logs
    mkdir -p ${TB_LOG_DIR}

    python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps 2000000 --num-threads 32 --eval-freq 10000 --eval-episodes 100 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env dummy --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} ${ENV_ID} ${ENTROPY_COEFF} --hyperparams ent_coef:${ENTROPY_COEFF} ppo_mode:${PPO_MODE}
    # python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps 2000000 --num-threads 32 --eval-freq 10000 --eval-episodes 100 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env dummy --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} ${ENV_ID} ${ENTROPY_COEFF} --hyperparams ent_coef:${ENTROPY_COEFF}  ppo_mode:${PPO_MODE} n_envs:16 
done
