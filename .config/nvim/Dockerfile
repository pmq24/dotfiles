FROM ubuntu:latest

SHELL ["/bin/bash", "--login", "-c"]

RUN apt update &&\
 apt upgrade --yes

RUN apt install\
 build-essential\
 curl\
 git\
 libffi-dev\
 libssl-dev\
 libyaml-dev\
 make\
 ripgrep\
 unzip\
 zlib1g-dev\
 --yes

RUN curl --location --remote-name https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz &&\
 rm --recursive --force /opt/nvim &&\
 tar -C /opt --extract --gzip --file nvim-linux64.tar.gz &&\
 echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> $HOME/.bash_profile

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 &&\
 echo '. "$HOME/.asdf/asdf.sh"' >> $HOME/.bash_profile

RUN asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git &&\
 asdf install nodejs latest &&\
 asdf global nodejs latest
  
RUN asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git && \
  asdf install ruby latest && \
  asdf global ruby latest

CMD source /etc/bash.bashrc &&\
 /bin/bash -c "cd ~/.config/nvim && /bin/bash"
