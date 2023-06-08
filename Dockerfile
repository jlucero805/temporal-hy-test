# syntax=docker/dockerfile:1

FROM python:3.11.3-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 7233
EXPOSE 42785
EXPOSE 57056
EXPOSE 35321
EXPOSE 46035
EXPOSE 7653
EXPOSE 8000

CMD ["hy", "worker.hy"]

