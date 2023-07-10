# Pytorch Lightning Template for Model Experimentation

# Overview
This project is attributed to build a robust deep learning experimentation pipeline. It can use any dataset as well as any model ranging from hugging face models to writing your own custom models. It incorporates Docker support, offering a convenient route for reproducibility, and is equipped to conduct training, evaluation tasks and inference tasks.

# Technologies Used
Pytorch Lightening - a lightweight PyTorch wrapper for high-performance AI research. Think of it as a framework for organizing your PyTorch code.

Hydra - a framework for elegantly configuring complex applications. The key feature is the ability to dynamically create a hierarchical configuration by composition and override it through config files and the command line. It can also instantiate classes recursively.

DVC(data version controlling)

# Key Features

1. Supports [Pytorch Custom Models](https://pytorch.org/vision/stable/models.html), [Huggingface Models](https://huggingface.co/models) and [Timm Models](https://github.com/huggingface/pytorch-image-models).
2. Model Training, Evaluation and Inference using [Pytorch Lightning Framework](https://lightning.ai/).
3. Docker Container Based Model Training and Evaluation
3. Experiments Configuration using [Hydra Template](https://hydra.cc/).
4. Data Versioning using Data Version Control(DVC)
5. Experiment Logging using:
    1. [Tensorboard](https://www.tensorflow.org/tensorboard/get_started).
    2. [Mlflow](https://github.com/mlflow/mlflow/)
    3. [Aim](https://github.com/aimhubio/aim)
<!-- 6. [Run Hyperaparameter Search using Lightning, Optuna and Hydra](https://github.com/u6yuvi/dl-package/tree/main#run-hyperparameter-tuning-with-pytorch-lightning-hydra-and-optuna) -->

## Getting Started
1. Clone the project 


```
copper_train --help
```

examples

- `copper_train data.num_workers=16`
- `copper_train data.num_workers=16 trainer.deterministic=True +trainer.fast_dev_run=True`

## Development

Install in dev mode

```
pip install -e .
```

### Docker

<docker-usage-instructions-here>
