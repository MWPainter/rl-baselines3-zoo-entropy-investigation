EXPR_ID="compare_ppo_modes"
ENV_ID="ALE/MontezumaRevenge-v5"
NTIMESTEPS=10000000
WANDB_PROJECT_NAME="entropy-investigation"
WANDB_ENTITY="michaelpainter-1994"
CODE_DIR="/home/michael/Desktop/rl-baselines3-zoo-entropy-investigation"

PPO_MODE="\"noent\"" 
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}

PPO_MODE="\"opt\"" 
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}

PPO_MODE="\"dbl\"" 
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}

PPO_MODE="\"dbltrn\""
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}





























EXPR_ID="compare_ppo_modes"
ENV_ID="CarRacing-v2"
NTIMESTEPS=4000000
WANDB_PROJECT_NAME="entropy-investigation"
WANDB_ENTITY="michaelpainter-1994"
CODE_DIR="/home/michael/Desktop/rl-baselines3-zoo-entropy-investigation"

PPO_MODE="\"noent\"" 
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}

PPO_MODE="\"opt\"" 
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ppo_mode:${PPO_MODE}

PPO_MODE="\"entcmp\"" 
ENTROPY_COEFF=0.0005
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ent_coef:${ENTROPY_COEFF} ppo_mode:${PPO_MODE}

PPO_MODE="\"dbl\"" 
ENTROPY_COEFF=0.0005
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ent_coef:${ENTROPY_COEFF} ppo_mode:${PPO_MODE}

PPO_MODE="\"dbltrn\"" 
ENTROPY_COEFF=0.0005
PPO_MODE_NO_QUOTES=${PPO_MODE#"\""}
PPO_MODE_NO_QUOTES=${PPO_MODE_NO_QUOTES%"\""}
LOG_DIR=${CODE_DIR}/logs/${EXPR_ID}/${ENV_ID}/${PPO_MODE_NO_QUOTES}
mkdir -p ${LOG_DIR}
TB_LOG_DIR=${LOG_DIR}/tb_logs
mkdir -p ${TB_LOG_DIR}
python -u train.py --algo ppo --env ${ENV_ID} --tensorboard-log $TB_LOG_DIR --n-timesteps ${NTIMESTEPS} --num-threads 8 --eval-freq 10000 --eval-episodes 25 --n-eval-envs 5 --save-freq 100000 --log-folder ${LOG_DIR} --vec-env subproc --device cuda --uuid --track --wandb-project-name ${WANDB_PROJECT_NAME} --wandb-entity ${WANDB_ENTITY} --wandb-tags ${PPO_MODE} ${EXPR_ID} --hyperparams ent_coef:${ENTROPY_COEFF} ppo_mode:${PPO_MODE}














