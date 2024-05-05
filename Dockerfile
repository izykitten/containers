FROM ghcr.io/izykitten/tumbleweed-distrobox:tumbleweed-distrobox

# Install packman packages

RUN zypper -n addrepo -cfp 90 \
     'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials
     && zypper -n dup --from packman --allow-vendor-change \
     && zypper clean

# Install Sublime Merge

RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg \
 && zypper -n addrepo -cfp 1000 https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo \
 && zypper -n install sublime-merge \
 && zypper clean
