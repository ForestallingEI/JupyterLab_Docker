FROM ubuntu:23.04

RUN apt update && apt install -y sudo wget vim curl gawk make gcc
RUN sudo apt install bzip2

RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh && \
    sh Anaconda3-2023.03-1-Linux-x86_64.sh -b  && \
    rm -f Anaconda3-2023.03-1-Linux-x86_64.sh && \
    sudo curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -  && \
    sudo apt install -y nodejs

ENV PATH $PATH:/root/anaconda3/bin

RUN pip install --upgrade pip
RUN pip install pandas_datareader
RUN pip install matplotlib
RUN pip install numpy
RUN pip install tensorflow

RUN mkdir /workspace

CMD ["jupyter-lab", "--ip=0.0.0.0","--port=8888" ,"--no-browser", "--allow-root", "--LabApp.token=''"]
