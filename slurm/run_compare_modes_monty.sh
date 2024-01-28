EXPR_ID="compare_ppo_modes"
ENV_ID="ALE/MontezumaRevenge-v5"
NTIMESTEPS=10000000

OUT_DIR=slurm_out/${EXPR_ID}/mnty
mkdir -p $OUT_DIR

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/noent.out
JOB_NAME=mnty-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/opt.out
JOB_NAME=mnty-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm

PPO_MODE="\"dbl\"" 
OUT_FILE=${OUT_DIR}/dbl.out
JOB_NAME=mnty-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm

PPO_MODE="\"dbltrn\""
OUT_FILE=${OUT_DIR}/dbltrn.out
JOB_NAME=mnty-${EXPR_ID}-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm
