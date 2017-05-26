# OpenFOAM-dev on ubuntu 16.04

FROM openfoam/openfoam-dev-graphical-apps

MAINTAINER Kirk.Jarvis

WORKDIR /root

RUN set -x && \

  # install awscli
    sudo curl -O https://bootstrap.pypa.io/get-pip.py && \
    sudo python3 get-pip.py --user && \
    export PATH=/root/.local/bin:$PATH && \
    /bin/bash -c "source /root/.bashrc" && \
    pip install awscli --upgrade --user

ENV AWS_DEFAULT_REGION=us-east-1 \
    AWS_DEFAULT_OUTPUT=json

ADD https://raw.githubusercontent.com/zuuzlo/openFoamDockerECS/master/openfoam_run.sh /root
RUN sudo chmod +x /root/openfoam_run.sh
CMD ["/root/openfoam_run.sh"]
