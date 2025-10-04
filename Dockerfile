FROM ubuntu:20.04

ARG USERNAME=camper
ARG HOMEDIR=/workspace/

ENV TZ="America/New_York" \
  LOCALE=en_US.UTF-8

RUN apt update && apt install -y sudo
RUN yes | unminimize
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN adduser --disabled-password --gecos '' ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USERNAME}

RUN sudo apt install -y curl git postgresql postgresql-contrib nano bash-completion man-db
RUN sudo locale-gen ${LOCALE} && sudo update-locale LANG=${LOCALE}
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN sudo apt install -y nodejs
RUN sudo mkdir /workspace

WORKDIR ${HOMEDIR}

ENV CODEROAD_DISABLE_RUN_ON_SAVE=true
# Do not change above this line.

# Paste your token below:
ENV CODEROAD_WEBHOOK_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOiJXdUhkZXg3YjV3Mk1JcmFNRTdranI1RUpGWm93RVRFb1RPRVRkYmJnZEMwQVBES0hFd3pDWjd0ZlJWbnFEYmhXIiwiaWF0IjoxNzU5NDU3OTU0fQ.ZtFO_3OQVgA5dDeK1uGT_K573GnJoB1wcyQou1wqrTc"
