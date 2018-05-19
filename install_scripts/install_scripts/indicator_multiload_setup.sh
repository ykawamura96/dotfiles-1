if [ -e /usr/share/indicator-multiload/preferences.ui ]; then
    cp ./preferences.ui /usr/share/indicator-multiload/preferences.ui -f;
else
    echo "cannot not find config file for gnome-system-monitor"
fi
