EXPR_ID="compare_ppo_modes_v2"
ENV_IDS_ARR=("HalfCheetah-v4" "Hopper-v4" "Humanoid-v4" "Walker2d-v4")
#https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-a-bash-array-into-a-delimited-string
ENV_IDS=$(IFS=';' ; echo "${ENV_IDS_ARR[*]}")

OUT_DIR=slurm_out/${EXPR_ID}/mu
mkdir -p $OUT_DIR

# mujoco envs with ent_coef > 1e-5

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/noent.out
JOB_NAME=mu-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/opt.out
JOB_NAME=mu-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbl\"" 
OUT_FILE=${OUT_DIR}/dbl.out
JOB_NAME=mu-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"dbltrn\""
OUT_FILE=${OUT_DIR}/dbltrn.out
JOB_NAME=mu-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm
