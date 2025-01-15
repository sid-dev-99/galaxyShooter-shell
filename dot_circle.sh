#!/bin/bash

# Define the position and delay
CENTER_ROW=$(( $(tput lines) / 2 ))
CENTER_COL=$(( $(tput cols) / 2 ))

# Define the fade effect duration
FADE_DURATION=5
FADE_STEPS=10
SLEEP_TIME=$(echo "$FADE_DURATION / $FADE_STEPS" | bc -l)

# ANSI Escape code to clear the screen
clear

# Function to draw the dot with fading effect
draw_dot_with_fade() {
  for i in $(seq $FADE_STEPS -1 1); do
    # Calculate brightness based on step (ANSI supports 24-bit colors)
    BRIGHTNESS=$((i * 25 + 25)) # Scale brightness to 0-255
    printf "\033[48;2;$BRIGHTNESS;$BRIGHTNESS;0m" # Set background color
    printf "\033[%d;%dH " $CENTER_ROW $CENTER_COL # Move to the center and print the dot
    sleep $SLEEP_TIME
  done

  # Reset terminal to default
  printf "\033[0m"
}

# Call the function to draw the dot
draw_dot_with_fade

# Clear the screen after the effect
clear
