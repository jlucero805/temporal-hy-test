# syntax=docker/dockerfile:1

FROM ubuntu:20.04

WORKDIR /app

RUN apt-get -y update
RUN apt-get -y install curl
RUN curl -sSf https://temporal.download/cli.sh | sh
RUN echo export PATH="\$PATH:/root/.temporalio/bin" >> ~/.bashrc
SHELL ["/bin/bash", "-c"]
RUN source ~/.bashrc

RUN echo $PATH


ENV PATH=${PATH}:/root/.temporalio/bin

RUN echo $PATH

COPY . .

EXPOSE 7233

CMD ["temporal", "server", "start-dev"]