EXPR_ID="compare_ppo_modes"
ENV_IDS=("HalfCheetah-v4" "Hopper-v4" "Humanoid-v4" "Walker2d-v4")

OUT_DIR=slurm_out
mkdir -p $OUT_DIR

# mujoco envs with ent_coef > 1e-5

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
sbatch --job-name=${EXPR_ID}-${PPO_MODE} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
sbatch --job-name=${EXPR_ID}-${PPO_MODE} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbl\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
sbatch --job-name=${EXPR_ID}-${PPO_MODE} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbltrn\""
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
sbatch --job-name=${EXPR_ID}-${PPO_MODE} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm
