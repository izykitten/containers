FROM registry.opensuse.org/opensuse/distrobox:latest

# Install kde
RUN zypper -n in --no-recommends -t pattern kde_plasma \
 && zypper clean

# Install packman-essentials
RUN zypper -n addrepo -cfp 90 \
    'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials \
 && zypper -n --gpg-auto-import-keys dup --from packman-essentials --allow-vendor-change \
 && zypper clean

#Install: Github CLI, nodejs, yarn, Seafile, KDEConnect, Syncthing, VLC, Element
RUN zypper -n in \
              gh git htop nano python3-pipx \
              nodejs-common yarn \
              seafile-client kdeconnect-kde syncthing \
              vlc vlc-codecs \
              element-desktop \
              && zypper clean

# Install VSCode
RUN zypper -n addrepo -cfp 1000 obs://devel:tools:ide:vscode devel_tools_ide_vscode \
 && zypper -n --gpg-auto-import-keys in code \
 && zypper clean

# Install Sublime Merge
RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
 && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
 && zypper -n in sublime-merge \
 && zypper clean
