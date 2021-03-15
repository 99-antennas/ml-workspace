# ML - Workspace

Overview:

Installation:

This workspace is based on the following pre-built docker image:
https://hub.docker.com/r/jupyter/tensorflow-notebook. For convenience a number of additional packages have been added, including packages to access data on cloud platforms. To see a list of additional packages included, view the Dockerfile. Because the base image includes a number of large packages used for machine learning, building the image the first time may take a few minutes.

Image size: 4.44GB

To build the docker container and launch a Jupyter notebook server:

```
cd <path_to_working_directory>
docker build -t ml-workspace:latest ./
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work ml-workspace:latest
```

The -rm flag in the last command insures the container is removed once it is shutdown. The -p flag manages port forwarding and can be configured for your local environment. The -e flag allows the container to be edited and enables Jupyter Lab. The -v flag mounts the local directory and allows your work to be saved locally even after the container is stopped.

You can also run Jupyter Lab from within the container:
```
docker exec -it ml-workspace bash
jupyter lab --ip=0.0.0.0 --port=8080 --allow-root`
```

Alternately, you can install most of the typically used packages via pipenv by running:

```
pip install pipenv
pipenv install --dev
```
Some packages that require complex installations are not included in the Pipfile, but can be installed by following the commands in the Dockerfiles associated with the image.