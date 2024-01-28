EXPR_ID="compare_ppo_modes"
ENV_IDS=("BipedalWalkerHardcore-v3" "LunarLander-v2" "LunarLanderContinuous-v2")

OUT_DIR=slurm_out
mkdir -p $OUT_DIR

# this script runs all of the Box2d envs where the optimal ent_coef > 0

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=box-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=box-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbl\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=box-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbltrn\""
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=box-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm
