FROM ubuntu:latest
LABEL maintainer='amritanshu16@outlook.com'
RUN apt update -y && apt upgrade -y
RUN apt install -y \
    build-essential \
    curl \
    git \
    python3 \
    sudo \
    wget \
    zsh
RUN useradd -ms /bin/bash xps
RUN echo "xps ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/xps && \
    chmod 0440 /etc/sudoers.d/xps
USER xps
WORKDIR /home/xps
RUN sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sudo chown -R xps .oh-my-zsh .zshrc
RUN sudo chsh -s $(which zsh)
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
RUN echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.zshrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN cd ~/.nodenv && src/configure && make -C src && cd ~
RUN echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
RUN git clone https://github.com/nodenv/node-build.git $($HOME/.nodenv/bin/nodenv root)/plugins/node-build
RUN sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev
RUN ~/.pyenv/bin/pyenv install 3.6.5
RUN $HOME/.nodenv/bin/nodenv install 9.11.1
CMD echo 'Execute /bin/zsh while instantiating the container \ndocker run -it <image> /bin/zsh'