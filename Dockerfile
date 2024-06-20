FROM registry.opensuse.org/opensuse/distrobox:latest

# Install only required packages
#RUN sed -i 's/solver.onlyRequires = false/solver.onlyRequires = true/g' /etc/zypp/zypp.conf

# Install packman-essentials
RUN zypper -n addrepo -cfp 90 \
    'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials \
    && zypper -n --gpg-auto-import-keys dup --from packman-essentials --allow-vendor-change \
    && zypper clean

# Install KDE
RUN zypper -n in -t pattern kde kde_plasma \
 && zypper clean

#Install: Github CLI, Seafile, KDEConnect, Syncthing, Element, KeepassXC, gocryptfs, cnf
RUN zypper -n in \
              gh git cnf htop nano python3-pipx \
              seafile-client kdeconnect-kde syncthing \
              element-desktop \
              keepassxc \
              gocryptfs \
              && zypper clean

# Install Sublime Merge
RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
    && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
    && zypper -n in sublime-merge \
    && zypper clean

RUN zypper -n dup \
    && zypper clean
