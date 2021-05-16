FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04
RUN apt-get update && apt-get install -y \
            sudo \
            wget \
            vim \
            nano \
            curl \
            python3
WORKDIR /opt
#RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh && \
#    sh Anaconda3-2021.05-Linux-x86_64.sh -b -p /opt/anaconda3 && \
#    rm -f Anaconda3-2021.05-Linux-x86_64.sh
#ENV PATH /opt/anaconda3/bin:$PATH
ADD requirements.txt /opt
RUN pip install --upgrade pip && pip install \
    torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html \
    -r requirements.txt
WORKDIR /
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
#CMD bash