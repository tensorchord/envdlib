# Quick Start

Welcome to Ianvs! Ianvs aims to test the performance of distributed synergy AI solutions following recognized standards, 
in order to facilitate more efficient and effective development. Quick start helps you to test your algorithm on Ianvs 
with a simple example of industrial defect detection. You can reduce manual procedures to just a few steps so that you can 
build and start your distributed synergy AI solution development within minutes. 

Before using Ianvs, you might want to have the device ready: 
- One machine is all you need, i.e., a laptop or a virtual machine is sufficient and a cluster is not necessary
- 2 CPUs or more
- 4GB+ free memory, depends on algorithm and simulation setting
- 10GB+ free disk space
- Internet connection for GitHub and pip, etc
- Python 3.6+ installed
  
In this example, we are using the Linux platform with Python 3.6.9. If you are using Windows, most steps should still apply but a few like commands and package requirements might be different. 

## Step 1. Ianvs Env Preparation

``` shell
python -m pip install --pre envd
envd bootstrap

envd build build.envd
envd up
```
refer to the ML tool [envd](https://envd.tensorchord.ai/guide/getting-started.html).


## Step 2. Dataset and Model Preparation

Datasets and models can be large. To avoid over-size projects in the Github repository of Ianvs, the Ianvs code base does
not include origin datasets and models. Then developers do not need to download non-necessary datasets and models for a
quick start.

First, the user needs to prepare the dataset according to the targeted scenario, from source links (e.g., from Cloud
Service or Kaggle) provided by Ianvs. All scenarios with datasets are available [Links of scenarios](https://ianvs.readthedocs.io/en/latest/proposals/scenarios/industrial-defect-detection/pcb-aoi.html#). As an example in
this document, we are using [the PCB-AoI Public Dataset](https://ianvs.readthedocs.io/en/latest/proposals/scenarios/industrial-defect-detection/pcb-aoi.html#) put on Kaggle. The dataset is released by KubeEdge Ianvs and prepared by KubeEdge SIG AI members.
See [Details of PCB-AoI dataset](https://ianvs.readthedocs.io/en/latest/proposals/scenarios/industrial-defect-detection/pcb-aoi.html#) for more information.

``` shell
mkdir -p  /ianvs/dataset #One might use another path preferred
cd /ianvs/dataset
wget https://kubeedge.obs.cn-north-1.myhuaweicloud.com:443/ianvs/pcb-aoi/dataset.zip
unzip dataset.zip
```

The URL address of this dataset then should be filled in the configuration file ``testenv.yaml``. In this quick start,
we have done that for you and the interested readers can refer to [testenv.yaml](https://ianvs.readthedocs.io/en/latest/guides/how-to-test-algorithms.html#step-1-test-environment-preparation) for more details.

<!-- Please put the downloaded dataset on the above dataset path, e.g., `/ianvs/dataset`. One can transfer the dataset to the path, e.g., on a remote Linux system using [XFTP].  -->

Then we may Develop the targeted algorithm as usual. In this quick start, Ianvs has prepared an initial model for
benchmarking. One can find the model at [FPN-model](https://kubeedge.obs.cn-north-1.myhuaweicloud.com:443/ianvs/pcb-aoi/model.zip).


``` shell
mkdir -p /ianvs/initial_model && cd /ianvs/initial_model
wget https://kubeedge.obs.cn-north-1.myhuaweicloud.com:443/ianvs/pcb-aoi/model.zip
```

<!-- Please put the downloaded model on the above model path, e.g., `/ianvs/initial_model`. One can transfer the model to the path, e.g., on remote a Linux system using [XFTP].  -->

Related algorithm is also ready as a wheel in this quick start. 
``` shell
mkdir -p /ianvs/project && cd /ianvs/projdect
git clone https://github.com/kubeedge/ianvs.git

cd /ianvs/projdect/ianvs
python -m pip install examples/resources/algorithms/FPN_TensorFlow-0.1-py3-none-any.whl
```

The URL address of this algorithm then should be filled in the configuration file ``algorithm.yaml``. In this quick
start, we have done that for you and the interested readers can refer to [algorithm.yaml](https://ianvs.readthedocs.io/en/latest/guides/how-to-test-algorithms.html#step-1-test-environment-preparation) for more details.

## Step 3. Ianvs Execution and Presentation

We are now ready to run the ianvs for benchmarking on the PCB-AoI dataset. 

``` shell
cd /ianvs/projdect/ianvs
ianvs -f ./examples/pcb-aoi/singletask_learning_bench/benchmarkingjob.yaml
```

Finally, the user can check the result of benchmarking on the console and also in the output path(
e.g. `/ianvs/singletask_learning_bench/workspace`) defined in the benchmarking config file (
e.g. `benchmarkingjob.yaml`). In this quick start, we have done all configurations for you and the interested readers
can refer to [benchmarkingJob.yaml](https://ianvs.readthedocs.io/en/latest/guides/how-to-test-algorithms.html#step-1-test-environment-preparation) for more details.

The final output might look like this:   

|rank  |algorithm                |f1_score  |paradigm            |basemodel  |learning_rate  |momentum  |time                     |url                                                                                                                             |
|:----:|:-----------------------:|:--------:|:------------------:|:---------:|:-------------:|:--------:|:------------------------|:-------------------------------------------------------------------------------------------------------------------------------|
|1     |fpn_singletask_learning  | 0.8396   |singletasklearning  | FPN       | 0.1           | 0.5      | 2022-07-07 20:33:53     |/ianvs/pcb-aoi/singletask_learning_bench/workspace/benchmarkingjob/fpn_singletask_learning/49eb5ffd-fdf0-11ec-8d5d-fa163eaa99d5 |
|2     |fpn_singletask_learning  | 0.8353   |singletasklearning  | FPN       | 0.1           | 0.95     | 2022-07-07 20:31:08     |/ianvs/pcb-aoi/singletask_learning_bench/workspace/benchmarkingjob/fpn_singletask_learning/49eb5ffc-fdf0-11ec-8d5d-fa163eaa99d5 |

This ends the quick start experiment.

## What is next
Kubeedge-Ianvs: https://github.com/kubeedge/ianvs
