FROM registry.opensuse.org/opensuse/distrobox:latest

RUN zypper -n install \
              cnf \
              git \
              python3-pipx \
           && zypper clean
