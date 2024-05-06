FROM ghcr.io/izykitten/distroboxes:tumbleweed

# Install packman-essentials and media codecs

RUN rpm -v --import \
    https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/repodata/repomd.xml.key \
 && zypper -n addrepo -cfp 90 \
   'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials \
 && zypper -n dup --from packman-essentials --allow-vendor-change \
 && zypper -n in vlc vlc-codecs \
 && zypper clean

# Install KDE

#RUN zypper -n in -t pattern kde kde_plasma \
# && zypper clean

# Github CLI

RUN zypper -n in gh \
 && zypper clean

RUN zypper -n in kdeconnect-kde \
 && zypper clean

 # Seafile

 RUN zypper -n in seafile-client \
  && zypper clean

# Install Sublime Merge

RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
 && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
 && zypper -n in sublime-merge \
 && zypper clean

RUN zypper ref \
 && zypper -n dup \
 && zypper clean
