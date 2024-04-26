EXPR_ID="compare_ppo_modes_v2"
ENV_IDS_ARR=("BipedalWalker-v3" "Ant-v4" "Swimmer-v4" "HumanoidStandup-v2" "InvertedDoublePendulum-v2" "InvertedPendulum-v2" "Reacher-v2")
#https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-a-bash-array-into-a-delimited-string
ENV_IDS=$(IFS=';' ; echo "${ENV_IDS_ARR[*]}")

OUT_DIR=slurm_out/${EXPR_ID}/bm0
mkdir -p $OUT_DIR

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/opt.out
JOB_NAME=bm0-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm




