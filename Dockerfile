FROM registry.opensuse.org/opensuse/distrobox:latest

RUN zypper -n install \
              cnf \
              git \
              htop \
              python3-pipx \
           && zypper -n dup \
           && zypper clean
