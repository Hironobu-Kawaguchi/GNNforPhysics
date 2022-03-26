# FROM python:3.7
FROM nvcr.io/nvidia/tensorflow:22.02-tf1-py3
# FROM nvcr.io/nvidia/tensorflow:22.01-tf2-py3

WORKDIR /GNNforPhysics
COPY ./learning_to_simulate/requirements.txt requirements.txt 
# COPY ./learning_to_simulate_v2/requirements.txt requirements.txt 
RUN pip install -r requirements.txt
