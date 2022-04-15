# 深度学习多系统多框架环境配置

以 {doc}`build-ai` 为基础配置深度学习 GPU 环境。

1. Windows10 系统需要安装 [Visual Studio 2019 IDE](https://visualstudio.microsoft.com/zh-hans/vs/) 以提供 C/C++ 的支持。
2. 如果需要 GPU 配置的话，还要安装 [CUDA Toolkit 11.3 Update 1](https://developer.nvidia.com/cuda-downloads)。

````{admonition} MXnet
```shell
conda create -n mx python=3.9
conda activate mx
```
:::{tabbed} GPU
```shell
conda install cudatoolkit=10.2 #（Windows）
pip install mxnet-cu102 # （Windows）
conda install cudatoolkit=11.0 #（linux）
# pip install mxnet-cu110 （linux）
```
:::
:::{tabbed} CPU
```shell
pip install mxnet
```
:::
配置 Jupyter 内核
```shell
conda install ipykernel
python -m ipykernel install --name mx --display-name "MXNet" (--user)
```
````

````{admonition} Tensorflow
```shell
conda create -n tf python=3.9
conda activate tf
```
:::{tabbed} GPU
```shell
conda install cudatoolkit=11.1 cudnn=8 -c conda-forge
```
:::
配置 Jupyter 内核
```shell
pip install tensorflow tensorflow-probability
conda install ipykernel
python -m ipykernel install --name tf --display-name "TensorFlow" (--user)
```
````

````{admonition} Pytorch
```shell
conda create -n torch python=3.9
conda activate torch
```
:::{tabbed} GPU
```shell
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c conda-forge
```
:::
:::{tabbed} CPU
```shell
pip install torch torchvision
```
:::
配置 Jupyter 内核
```shell
conda install ipykernel
python -m ipykernel install --name torch --display-name "Pytorch" (--user)
```
````
