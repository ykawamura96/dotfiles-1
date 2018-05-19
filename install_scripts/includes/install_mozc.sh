# get integer part of ubuntu version
version="$(cat /etc/lsb-release | sed -n /DISTRIB_RELEASE/p | awk -F'[=]' '{print $2}')"

if [ $(echo "$version == 16.04" | bc) -eq 1 ]; then
    tar xavf mozc-*.tgz
    cd mozc-*/
    # correct source code
    sed -i s/'const bool kActivatedOnLaunch = false;'/'const bool kActivatedOnLaunch = true;'/g mut/src/unix/ibus/property_handler.cc
    # install dependent packages to build
    sudo apt-get install -y clang libdbus-1-dev libglib2.0-dev libgtk2.0-dev subversion tegaki-zinnia-japanese debhelper libibus-1.0-dev build-essential libssl-dev libxcb-xfixes0-dev python-dev gyp protobuf-compiler libqt4-dev libuim-dev libzinnia-dev fcitx-libs-dev devscripts ninja-build
    # start build
    sudo ./build_mozc_plus_utdict
    # remove packages used for the build
    tail -n 5 /var/log/apt/history.log | grep Install: | sed -e s/"Install: "// | sed -e s/", automatic"//g | sed -e s/"), "/"\n"/g | sed -e s/" (.*$"/""/g | tr '\n' ' ' | xargs sudo apt-get remove -y
    # install Mozc UT
    sudo apt install -y ./mozc-*.deb ./fcitx-mozc_*.deb ./ibus-mozc_*.deb
    # setup ibus
    gsettings set org.gnome.settings-daemon.plugins.keyboard active true
    cd ..
    # remove unused files
    rm -rf mozc-2.18.2598.102+dfsg-1~ut2-20171008a
fi
