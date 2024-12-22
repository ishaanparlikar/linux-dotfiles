#!/bin/bash

# Script to integrate ani-cli with rofi
# Dependencies: rofi, ani-cli

# Prompt user for anime name using rofi
ANIME_NAME=$(rofi -dmenu -p "Search Anime:" -lines 10 -width 50)

# Exit if no anime name is provided
if [ -z "$ANIME_NAME" ]; then
    exit 1
fi

# Prompt user for configuration using rofi
CONFIG_VALUE=$(rofi -dmenu -p "Enter Config (-c):" -lines 10 -width 50)

# Exit if no configuration value is provided
if [ -z "$CONFIG_VALUE" ]; then
    exit 1
fi

# Run ani-cli with -c flag
echo "Running ani-cli with -c $CONFIG_VALUE for anime: $ANIME_NAME"
ani-cli -c "$CONFIG_VALUE" "$ANIME_NAME"

