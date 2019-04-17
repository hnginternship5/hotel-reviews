#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "You must enter the model name as a parameter, e.g.: sh download_model.sh 117M"
    exit 1
fi

model=$1

mkdir -p models/$model


python download_gdrive.py 1-3oNuLzqm1i32Z7sv4_XJoGQe2x8EVqd /models/$model/checkpoint
python download_gdrive.py 1-5bgcxksuhamg_jhd6J2oRVWDujN6CMB /models/$model/encoder.json
python download_gdrive.py 1-7VWpbWUyqCPKhL5sJPoZrXwwZu9ouBL /models/$model/hparams.json
python download_gdrive.py 1-f2yx_Jbj0Nt02U_PTsQiYol_lQp0CrN /models/$model/model-38.data-00000-of-00001
python download_gdrive.py 1-g7wT0WvvfeLJMnWNaZ6w4cJxUp2BDXH /models/$model/model-38.index
python download_gdrive.py 1-gW88PGL5JDgPblMrOO0nanGfMo-dzbc /models/$model/model-38.meta
python download_gdrive.py 1-U9A6rb7-7PTjack-Kf2eXtr-n8MM2pL /models/$model/vocab.bpe



# TODO: gsutil rsync -r gs://gpt-2/models/ models/
#for filename in checkpoint encoder.json hparams.json model.ckpt.data-00000-of-00001 model.ckpt.index model.ckpt.meta vocab.bpe; do
#  fetch=$model/$filename
#  echo "Fetching $fetch"
# curl --output models/$fetch https://storage.googleapis.com/gpt-2/models/$fetch
#  curl --output models/$fetch https://ufile.io/hbjpb7lw/$fetch
#done
