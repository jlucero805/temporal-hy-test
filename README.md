# Running the worker

```bash
docker pull jlucero805/entropy:temporal-worker-hy
docker run jlucero805/entropy:temporal-worker-hy
```

Note: You may need to choose a specific platform. Example:

```bash
dock run --platform=linux/amd64 jlucero805/entropy:temporal-worker-hy
```

# Executing workflows

As long as the worker is running somewhere, then
the client script can be run for the worker to execute a workflow
on the machine that it is on.

First, make sure all dependencies are installed

```bash
pip3 install -r requirements.txt
```

(use a venv if needed.)

then run

```bash
hy client.hy <name of container to verify>
```

for example

```bash
hy client.hy "qdrant/qdrant"
```