# Docker-Workstation
A docker image to setup a Python and Node development environment quickly.  

# Features
- Based on Ubuntu 17.10
- Support for pre-populating home directory, if image is built using dockerfile
- Support for executing a bootstrap script, if image is built using dockerfile

# Useful applications included with image:
- pyenv
- nodenv
- openssh-server
- openvpn client
- vim
- git

# How to build the image
1. Clone this repo
2. Put the files to be copied to home directory of the container, inside
    directory `copy-to-home-in-container`
3. Remove the sample code and add your code to be executed at the build time,
    inside script `bootstrap.sh`
4. build docker image using following command:
    ```bash
    docker build -t <image_name>:<tag> .
    ```  

# How to start the docker container
## Creating a new saved volume
1. Create a new volume using following command:
    ```bash
    docker volume create <volume_name>
    ```
2. Run container using this volume:
    ```bash
    docker run -it \
      --name <container_name> \
      --mount source=<volume_name>,target=/home/xps \
      <image_name>:<tag> \
      /bin/zsh
    ```

## Using an existing volume
1. Check that volume exist:
    ```bash
    docker volume ls <volume_name>
    ```
2. Run container using this volume:
    ```bash
    docker run -it \
      --name <container_name> \
      --mount source=<volume_name>,target=/home/xps \
      <image_name>:<tag> \
      /bin/zsh
    ```