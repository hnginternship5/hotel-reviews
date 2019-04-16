#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "You must enter the model name as a parameter, e.g.: sh download_model.sh 117M"
    exit 1
fi

model=$1

mkdir -p models/$model


python download_gdrive.py 1t8LQg7dcDMRolRA5L828OoB9f82Vwzj0 /models/$model/checkpoint
python download_gdrive.py 1-bsS8w_BtkmbgfKYLmY_PIrYsZpO-eE0 /models/$model/encoder.json
python download_gdrive.py 1ZzZ6LDRjjmHMOtX0at3-jP9pMsZdgd6p /models/$model/hparams.json
python download_gdrive.py 1-5lyu9K6yx89KZrp3LShnL23JN_KF5-E /models/$model/model-24.data-00000-of-00001
python download_gdrive.py 1nJf4ltHeEOC3s7I1XBQzn_idn25LHnhw /models/$model/model-24.index
python download_gdrive.py 1RU7iqK0IrVUIYzrN6KX3KYHiXAD55YWX /models/$model/model-24.meta
python download_gdrive.py 1_wl56QssHzDIa7C-xARW9BZUEem8WXua /models/$model/vocab.bpe



# TODO: gsutil rsync -r gs://gpt-2/models/ models/
#for filename in checkpoint encoder.json hparams.json model.ckpt.data-00000-of-00001 model.ckpt.index model.ckpt.meta vocab.bpe; do
#  fetch=$model/$filename
#  echo "Fetching $fetch"
# curl --output models/$fetch https://storage.googleapis.com/gpt-2/models/$fetch
#  curl --output models/$fetch https://ufile.io/hbjpb7lw/$fetch
#done
