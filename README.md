# GNNforPhysics
Graph Neural Networks for Physics

``` bash
# docker build and run
docker build -t gnnforpysics/tensorflow:22.02-tf1-py3 .
docker run --name GNNforPysics -it --rm --gpus all -v $(pwd):/mydir/  -w /mydir gnnforpysics/tensorflow:22.02-tf1-py3
docker run --name GNNforPysics -it --rm --gpus '"device=0"' -v $(pwd):/mydir/  -w /mydir gnnforpysics/tensorflow:22.02-tf1-py3
docker run --name GNNforPysics -it --rm --gpus '"device=1"' -v $(pwd):/mydir/  -w /mydir gnnforpysics/tensorflow:22.02-tf1-py3
```

``` shell
docker-compose up -d
docker-compose up
```


``` bash
# Download dataset (e.g. WaterRamps):
bash ./learning_to_simulate/download_dataset.sh WaterDrop ./tmp/datasets
```

{DATASET_NAME} one of the datasets following the naming used in the paper:
1. WaterDrop
1. Water
1. Sand
1. Goop
1. MultiMaterial
1. RandomFloor
1. WaterRamps
1. SandRamps
1. FluidShake
1. FluidShakeBox
1. Continuous
1. WaterDrop-XL
1. Water-3D
1. Sand-3D
1. Goop-3D

``` bash
# Train a model:
export TF_FORCE_GPU_ALLOW_GROWTH=true
python -m learning_to_simulate.train --data_path=./tmp/datasets/Water --model_path=./tmp/models/Water --num_steps 500000
```

``` bash
# Generate some trajectory rollouts on the test set:
mkdir -p ./tmp/rollouts
python -m learning_to_simulate.train \
    --mode="eval_rollout" \
    --data_path=./tmp/datasets/WaterRamps \
    --model_path=./tmp/models/WaterRamps \
    --output_path=./tmp/rollouts/WaterRamps
```

``` bash
# Plot a trajectory:
python -m learning_to_simulate.render_rollout \
    --rollout_path=./tmp/rollouts/WaterRamps/rollout_test_1.pkl

python -m learning_to_simulate.render_rollouts --rollout_path=./tmp/rollouts/WaterRamps --test_num=100
```
