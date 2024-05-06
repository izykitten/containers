FROM ghcr.io/izykitten/distroboxes:tumbleweed

# Install packman-essentials
RUN rpm -v --import \
    https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/repodata/repomd.xml.key \
 && zypper -n addrepo -cfp 90 \
   'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials \
 && zypper -n dup --from packman-essentials --allow-vendor-change \
 && zypper clean

# Install KDE
RUN zypper -n in -t pattern kde_plasma \
                 && zypper clean
