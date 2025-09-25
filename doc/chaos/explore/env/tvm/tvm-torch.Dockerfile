# 镜像名称 tvmx:torch
FROM tvmx:py310-base
# RUN pip3 install torch==1.8.2 torchvision==0.9.2 numpy==1.22 \
#     --extra-index-url https://download.pytorch.org/whl/lts/1.8/cpu
RUN pip3 install torch torchvision torchaudio