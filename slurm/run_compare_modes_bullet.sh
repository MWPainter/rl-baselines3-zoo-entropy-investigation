EXPR_ID="compare_ppo_modes"
ENV_IDS=("HalfCheetahBulletEnv-v0" "AntBulletEnv-v0" "Walker2DBulletEnv-v0" "HopperBulletEnv-v0" "ReacherBulletEnv-v0" "MinitaurBulletEnv-v0" "MinitaurBulletDuckEnv-v0" "HumanoidBulletEnv-v0" "InvertedDoublePendulumBulletEnv-v0" "InvertedPendulumSwingupBulletEnv-v0")

OUT_DIR=slurm_out
mkdir -p $OUT_DIR

# in the bullet envs, all of the optimal ent_coef's are 0.0, so try out the dbl methods with ent=5e-4

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=blt-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=blt-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE} train_agent_many_env.slurm

PPO_MODE="\"entcmp\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=blt-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbl\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=blt-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm

PPO_MODE="\"dbltrn\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/${EXPR_ID}/${PPO_MODE}.out
JOB_NAME=blt-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_IDS=${ENV_IDS},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_many_env_cstm_entr.slurm
