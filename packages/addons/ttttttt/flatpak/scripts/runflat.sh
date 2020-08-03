#!/bin/sh

FLATPAK=$1
TMP=$(mktemp -u runflat.XXXXXX)

. /etc/profile

# Add the Flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if ! flatpak list | grep -q $1; then
  # Install flatpak in a terminal
  alacritty -e /bin/sh -c "flatpak install -y $1 && sleep 1 || (touch $TMP ; sleep 5)"
  # Post-install tweaks
  case $1 in
    org.mozilla.firefox)
      # Set some Wayland overrides
      flatpak override --env=MOZ_ENABLE_WAYLAND=1 \
	               --env=MOZ_ACCELERATED=1 \
		       --env=MOZ_WEBRENDER=1 \
		       --socket=wayland $1
      ;;
    com.valvesoftware.Steam)
      # Remove the "don't run as root" check in bin_steam.sh
      find /storage/.cache/flatpak/app/com.valvesoftware.Steam \
        -name "bin_steam.sh" \
        -exec sed -e "/^# Don't allow/,/^$/d" -i \{} \;
      ;;
  esac
fi

# Do or die
if [ -f $TMP ]; then
  echo "Flatpak installation of $1 failed."
  rm -f $TMP
else
  case $1 in
    org.mozilla.firefox)
      # Firefox will try to use GLX instead of EGL if DISPLAY is set
      unset DISPLAY
      ;;
  esac
  exec flatpak run $@ >> /var/log/$1.log 2>&1
fi
