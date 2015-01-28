# Where/What is this binary? Shows extended ls output
function what() {
    which $1 | xargs ls -la
}

# *--------------------------------*
#  B u r n - D V D s ( O_o )
# *--------------------------------*
function burn-dvds {
  echo "Burning" $# "DVD's in TOTAL."
  echo "========================="
  for arg in $@
  do
    is-blank-dvd
    echo "Burning $arg"
    growisofs -dvd-compat -Z /dev/cdrom=$arg
    read -p "-- Please wait for drive to settle before pressing [ENTER] again and make sure the media is empty and/or writable."

    # wait ? or delay check?
    # LOAD_TRAY error ?
  done
  for arg in $@
  do
      rm -i $arg
  done
  echo "==========[END]=========="
}

function is-blank-dvd {
  blank=(`udisks --show-info /dev/cdrom | grep -c 'blank: *1'`);
  until [ "$blank" -eq 1 ]; do
        let blank=(`udisks --show-info /dev/cdrom | grep -c 'blank: *1'`)
  done
}

# Pull Request in one command
# Example:
#     mpr "Added sp"
function mpr() {
    git commit -am "init commit"
    branch=`git rev-parse --abbrev-ref HEAD`
    git push -u origin $branch
    hub pull-request -b develop
}


# choose a random wallpaper
function randomwp() {
    local PIC=$(ls ${HOME}/Pictures/backgrounds | sort -R | head -1)
    feh --bg-scale ${HOME}/Pictures/backgrounds/$PIC
}

function togglecpu () {
    [ "$(cpufreq-info | grep \"ondemand\")" ] && \
    sudo cpufreq-set -g performance || \
    sudo cpufreq-set -g ondemand ;
}

function unrax() {
if (unrar vb "$1" | grep ".*/">/dev/null); then
   echo $1
   unrar x "$1"
else
   echo $1
   unrar x -ad "$1"
fi
}

# == unrar all files in dir. ==
# unrax unrars and created a folder if RAR doesn't contain one, to stop cluttering the current path.
# depends on unrax in .bash_functions
function unrax-all() {
for i in $( ls *.rar ); do unrax "$i"; echo "$i"; done
}

# remind me, its important!
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
function remindme()
{
    sleep $1 && zenity --info --text "$2" &
}

# BRIGTNESS 1-10
function brightness_dim() {
    sudo sh -c "echo '$1' >> /sys/class/backlight/acpi_video0/brightness"
}
