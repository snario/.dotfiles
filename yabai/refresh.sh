#!/usr/bin/env sh

number_of_windows=$(yabai -m query --windows --space | jq 'length')
number_of_stacked=$(yabai -m query --windows --space | jq -c 'map(select(."stack-index" != 0)) | length')
currspace=$(yabai -m query --spaces --space | jq '.index')

padding=0
spadding=40

[[ "$number_of_windows" -eq 1 ]] && padding=0
[[ "$number_of_stacked" = 0 ]] && spadding=$padding

yabai -m config --space "$currspace" top_padding 10
yabai -m config --space "$currspace" bottom_padding 50
yabai -m config --space "$currspace" left_padding 10
yabai -m config --space "$currspace" right_padding 270
yabai -m config --space "$currspace" window_gap 10

# Destroy excess spaces
# https://github.com/koekeishiya/yabai/issues/1631#issuecomment-1433401969

function get_excess_spaces(){
    local target=$1
    echo $(yabai -m query --spaces | jq "length - $target")
}

function get_last_space(){
    local display=$1
    echo $(yabai -m query --spaces --display $display | jq '.[-1].index')
}

function destroy_excess_spaces(){
    local target=$1
    local display=$2
    [ -z $display ] && display=1
    excess=$(get_excess_spaces $target)
    while (( excess > 0 )); do
        yabai -m space --destroy $(get_last_space $display)
        excess=$(get_excess_spaces $target)
    done
}

# Resize the Stickies window to 800x600 pixels
# Resize each Stickies window to 800x600 pixels
display_width=$(yabai -m query --displays | jq '.[0].frame.w')
yabai -m query --windows | jq -r '.[] | select(.app == "Stickies") | .id' | while read -r stickies_id; do
  yabai -m window "$stickies_id" --resize abs:50:200 --move abs:$((display_width - 160)):420
done

destroy_excess_spaces $@
