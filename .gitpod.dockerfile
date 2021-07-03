FROM gitpod/workspace-postgres

# 0. Switch to root
USER root

# 1. Install direnv & git-lfs
RUN apt-get update -y && apt-get install direnv \
                    git-lfs

# 2. Install Nix
RUN addgroup --system nixbld \
  && usermod -a -G nixbld gitpod \
  && mkdir -m 0755 /nix && chown gitpod /nix \
  && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf \
  && echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

CMD /bin/bash -l
USER gitpod
ENV USER gitpod
WORKDIR /home/gitpod

RUN touch .bash_profile && \
  curl -sSL https://github.com/numtide/nix-flakes-installer/releases/download/nix-2.4pre20210207_fd6eaa1/install | sh

RUN mkdir -p /home/gitpod/.config/nixpkgs && echo '{ allowUnfree = true; }' >> /home/gitpod/.config/nixpkgs/config.nix

RUN echo '. /home/gitpod/.nix-profile/etc/profile.d/nix.sh' >> /home/gitpod/.bashrc
RUN echo 'eval "$(direnv hook bash)"' >> /home/gitpod/.bashrc

RUN . /home/gitpod/.nix-profile/etc/profile.d/nix.sh && \
  nix-env -i \
    nixpkgs-fmt \
    nvfetcher \
    nodejs \
    yarn \
    act \
    tdlib \
    nix-prefetch-git && \
  nix-env -iA cachix -f https://cachix.org/api/v1/install && \
  cachix use indexyz

# n. Give back control
USER root
