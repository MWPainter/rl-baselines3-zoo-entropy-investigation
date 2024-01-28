EXPR_ID="compare_ppo_modes"
ENV_IDS=("Pendulum-v1" "CartPole-v1" "MountainCar-v0" "MountainCarContinuous-v0" "Acrobot-v1")

OUT_DIR=slurm_out/${EXPR_ID}/gym
mkdir -p $OUT_DIR

# in the gym control envs, only MountainCarContinuous-v0 has a non zero entropy coeff
# so for dbl and dbltrn modes set entropy coeff to 0.005 (which is approx what ent_coef is in MountainCarContinuous-v0)

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/noent.out
JOB_NAME=gym-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/opt.out
JOB_NAME=gym-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"entcmp\"" 
ENTROPY_COEFF=0.005
OUT_FILE=${OUT_DIR}/entcmp.out
JOB_NAME=gym-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbl\"" 
ENTROPY_COEFF=0.005
OUT_FILE=${OUT_DIR}/dbl.out
JOB_NAME=gym-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbltrn\"" 
ENTROPY_COEFF=0.005
OUT_FILE=${OUT_DIR}/dbltrn.out
JOB_NAME=gym-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm
