EXPR_ID="tst_entm"
ENV_ID="Ant-v4"
PPO_MODE="\"dbltrn\""  # in {noent, opt, dbl, dbltrn}
ENTROPY_COEFFS=("0.01" "0.0001")

OUT_DIR=slurm_out
mkdir -p $OUT_DIR
OUT_FILE=${OUT_DIR}/${EXPR_ID}.out

sbatch --job-name=${EXPR_ID} --output=${OUT_FILE} --export=EXPR_ID=${EXPR_ID},ENV_ID=${ENV_ID},PPO_MODE=${PPO_MODE},ENTROPY_COEFFS=${ENTROPY_COEFFS} train_agent.slurm