#!/bin/bash
dynet_seed=$1
output_prefix=expts/gen_silver_${dynet_seed}
build/nt-parser/nt-parser-gen \
    --cnn-seed ${dynet_seed} \
    --cnn-mem 3000,3000,4000 \
    -x \
    -T corpora/silver_train_gen.oracle \
    -d corpora/silver_dev_gen.oracle \
    --gold_training_data corpora/silver_wsj-train_gen.oracle \
    -t \
    --clusters clusters-silver-train-berk.txt \
    --input_dim 256 \
    --lstm_input_dim 256 \
    --hidden_dim 256 \
    -D 0.3 \
    > ${output_prefix}.stdout \
    2> ${output_prefix}.stderr
