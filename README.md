# Pytorch Ligtning Model Experimentation Template

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)![PyTorch](https://img.shields.io/badge/PyTorch-%23EE4C2C.svg?style=for-the-badge&logo=PyTorch&logoColor=white)![hydra](https://img.shields.io/badge/Config-Hydra_1.3-89b8cd)![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)


# Key Features

1. Supports [Pytorch Custom Models](https://pytorch.org/vision/stable/models.html), [Huggingface Models](https://huggingface.co/models) and [Timm Models](https://github.com/huggingface/pytorch-image-models).
2. Model Training and Evaluation using [Pytorch Lightning Framework](https://lightning.ai/).
3. [Docker Container Based Model Training and Evaluation](https://github.com/u6yuvi/dl-package/tree/main#using-docker-containers)
3. Experiments Configuration using [Hydra Template](https://hydra.cc/).
4. Experiment Logging using:
    1. [Tensorboard](https://www.tensorflow.org/tensorboard/get_started).
    2. [Mlflow](https://github.com/mlflow/mlflow/)
    3. [Aim](https://github.com/aimhubio/aim)
5. [Run Hyperaparameter Search using Lightning, Optuna and Hydra](https://github.com/u6yuvi/dl-package/tree/main#run-hyperparameter-tuning-with-pytorch-lightning-hydra-and-optuna)
6. Data Versioning using Data Version Control
7. Serializable and optimizable Pytorch models using TorchScript
8. [Build & Share Model Demos using Gradio](https://github.com/u6yuvi/dl-package#build--share-model-demos-using-gradio)


## Getting Started
1. Clone the project
```bash
git clone https://github.com/shreyash-99/lightning-template.git
cd lightning-template
```
2. 

### Run in Conda Environment 

#### Install Dependencies 

```
# clone project 
git clone https://github.com/u6yuvi/dl-package.git dl-package
cd dl-package/

# create conda environment [dl-project]
conda env create -f conda_env.yml 
conda activate dl-project

#install dl_pkg package
pip3 install -e .

#Train Model through command line
- `dl_pkg_train data.num_workers=16`
or 
- `dl_pkg_train data.num_workers=16 trainer.deterministic=True +trainer.fast_dev_run=True`

Experiment Artifacts stored at path: outputs/
Refer- configs/hydra/default.yaml for more information on configuring output dir.

#Evaluate Model
Add the model checkpoint filename at configs/eval.yaml
    ckpt_file: xxx.ckpt
or  pass it through command line while running evaluation

- `dl_pkg_eval ckpt_file=2023-06-17/20-23-38/checkpoints/last.ckpt`
or 
- `python3 dl_pkg/eval.py data=cifar.yaml model=timm.yaml ckpt_file=2023-06-15/00-46-28/checkpoints/last.ckpt`
```

# Hydra Template 

Lists all the configurable parameters for this project during:
1. Training
```
dl_pkg_train --help
```
2. Evaluation
```
dl_pkg_evaluate --help
```

# Run Tensorboard 
```
tensorboard --logdir='outputs/path_to_tensorboard_logs' --port=xxxx
```
![](images/tensorboard.png)

![Tensorboard logs Directory](images/tensorboard_logs.png)

# Docker Commands
1. Build Docker Image
```
docker build -t dl-package -f .devcontainer/Dockerfile .
```

# Download Dataset
1. DogvsCat
```
wget https://download.microsoft.com/download/3/E/1/3E1C3F21-ECDB-4869-8368-6DEBA77B919F/kagglecatsanddogs_5340.zip
unzip kagglecatsanddogs_5340.zip

#split dataset in train and test
scripts/split_dataset.py
#Delete empty files
find . -type f -empty -print -delete
```

# DVC Configuration
```
#Set remote storage for storing data and model artifacts
dvc remote add -d local <path_to_local_directory>

#Push data to remote directory
dvc push data outputs

#Pull data from remote directory
dvc pull
```

Read more about [DVC](https://dvc.org/doc)

# Maintainers

 [Shreyash Gupta](https://github.com/shreyash-99)




# Misc Commands

```
#create and run service
docker-compose  -f .devcontainer/docker-compose_copy.yml  up --build
#create and run specific service
docker compose  -f .devcontainer/docker-compose.yml up --build demo
#mount volumne
docker compose run -v ${pwd}/logs <image_name> bash
#run experiment
dl_pkg_train -m hydra/launcher=joblib hydra.launcher.n_jobs=4 experiment=cifar_vit model.net.patch_size=1,2,4,8,16 data.num_workers=0
#pushing to docker hub
docker login -u NAME
docker image tag trtest USER/trtest:latest
docker image push USER/trtest:latest
```
