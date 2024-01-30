EXPR_ID="compare_ppo_modes"
ENV_ID="CarRacing-v2"
NTIMESTEPS=4000000

OUT_DIR=slurm_out/${EXPR_ID}/cr
mkdir -p $OUT_DIR

PPO_MODE="\"noent\"" 
OUT_FILE=${OUT_DIR}/noent.out
JOB_NAME=cr-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm

PPO_MODE="\"opt\"" 
OUT_FILE=${OUT_DIR}/opt.out
JOB_NAME=cr-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent_cstm_tmstp.slurm

PPO_MODE="\"entcmp\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/entcmp.out
JOB_NAME=cr-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_cstm_tmstp_entr.slurm

PPO_MODE="\"dbl\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/dbl.out
JOB_NAME=cr-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_cstm_tmstp_entr.slurm

PPO_MODE="\"dbltrn\"" 
ENTROPY_COEFF=0.0005
OUT_FILE=${OUT_DIR}/dbltrn.out
JOB_NAME=cr-${PPO_MODE}
sbatch --job-name=${JOB_NAME} --output=${OUT_FILE} --export=NTIMESTEPS=${NTIMESTEPS},EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE},ENTROPY_COEFF=${ENTROPY_COEFF} train_agent_cstm_tmstp_entr.slurm
