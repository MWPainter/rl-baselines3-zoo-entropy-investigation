EXPR_ID="tst_base"
ENV_ID="Ant-v4"
PPO_MODE="\"dbltrn\""  # in {noent, opt, dbl, dbltrn}

OUT_DIR=slurm_out
mkdir -p $OUT_DIR
OUT_FILE=${OUT_DIR}/${EXPR_ID}.out

sbatch --job-name=${EXPR_ID} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE} train_agent.slurm