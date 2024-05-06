FROM ghcr.io/izykitten/distroboxes:tumbleweed-desktop-base


# Install Sublime Merge

RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
 && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
 && zypper -n in sublime-merge \
 && zypper clean
 

#Install: Github CLI, nodejs, yarn, Seafile, KDEConnect, Syncthing, VLC
RUN zypper -n in gh \
                 nodejs-common yarn \
                 seafile-client kdeconnect-kde syncthing \
                 vlc vlc-codecs \
                 && zypper clean


# Install Patterns: KDE
RUN zypper -n in -t pattern kde_plasma \
                 && zypper clean
