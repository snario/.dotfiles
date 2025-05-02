#!/bin/zsh


# Function to capture the current space index using yabai and jq
capture_space_index() {
    local space_index  # Declaring space_index as a local variable
    space_index=$(yabai -m query --spaces --space | jq -r '.index') 

    if [ -z "$space_index" ]; then  # Checking if space_index is empty
        echo "Error: Failed to capture space ID."
        exit 1
    fi
    echo "$space_index"  # Returning space_index
}

# Capture the current space ID dynamically
space_index_before_restart=$(capture_space_index)

yabai -m space --focus 7

# Restart the yabai service
yabai --restart-service

sleep 1

# Focus back on the original space using its dynamically captured index
yabai -m space --focus "$space_index_before_restart"

