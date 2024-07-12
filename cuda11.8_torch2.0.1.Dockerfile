# Use an official Python runtime as a parent image
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

# Set the working directory in the container
WORKDIR /workspace

# Update and install dependencies, create symlinks, and install PyTorch, torchvision, torchaudio, xformers, and MMCV
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3.8 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu118 \
    && pip install -U xformers --index-url https://download.pytorch.org/whl/cu118 \
    && pip install mmcv==2.0.1 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0/index.html \
    && pip install -U openmim \
    && mim install mmengine

# Clone the mmsegmentation repository and install it
RUN git clone -b main https://github.com/open-mmlab/mmsegmentation.git \
    && cd mmsegmentation \
    && pip install -v -e .

# Install additional dependencies
RUN pip install opencv-python numpy Pillow DateTime matplotlib \
    plyfile HTML4Vision timm tensorboardX imgaug iopath imagecorruptions DateTime

# Metric3D environment setup complete
# This Dockerfile sets up the environment for metric3d with the necessary dependencies

# Set the working directory to /workspace
WORKDIR /workspace

# Define the default command to run when starting the container
CMD ["bash"]
