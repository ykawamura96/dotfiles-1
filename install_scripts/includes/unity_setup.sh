# for System monitor preferences
if [ -e /usr/share/indicator-multiload/preferences.ui ]; then
    cp ./preferences.ui /usr/share/indicator-multiload/preferences.ui -f;
else
    echo "cannot not find config file for gnome-system-monitor"
fi

# for Unity Date & Time display
gsettings set com.canonical.indicator.datetime show-clock true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime time-format 24-hour
gsettings set com.canonical.indicator.datetime show-seconds true
