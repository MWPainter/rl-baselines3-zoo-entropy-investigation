EXPR_ID="compare_ppo_modes"
ENV_IDS=("BipedalWalker-v3" "Ant-v4" "Swimmer-v4" "HumanoidStandup-v2" "InvertedDoublePendulum-v2" "InvertedPendulum-v2" "Reacher-v2")

OUT_DIR=slurm_out
mkdir -p $OUT_DIR

# this script runs all of the Box2D and MuJoCo envs that have an optimal ent_coef < 1e-5)
# "BipedalWalker-v3" "Ant-v4" "Swimmer-v4" all have optimal ent_coef == 0
# "HumanoidStandup-v2" "InvertedDoublePendulum-v2" "InvertedPendulum-v2" "Reacher-v2" all have optimal ent_coef < 1e-5
# try with ent_coef = 5e-4

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=bm0-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=bm0-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"entcmp\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=bm0-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbl\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=bm0-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbltrn\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=bm0-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm
