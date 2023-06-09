#!/bin/bash

calculate_remaining_age() {
  # Read user's birthday
  read -p "Enter your birthday (YYYY-MM-DD): " birthday

  # Get current date
  current_date=$(date +%F)

  # Calculate remaining time until reaching age 67
  remaining_time=$(date -u -d "$birthday +67 years" +%s)
  current_time=$(date -u -d "$current_date" +%s)
  seconds_remaining=$((remaining_time - current_time))

  # Check if already reached age 67
  if (( seconds_remaining <= 0 )); then
    echo "You have already reached the age of 67."
  else
    # Calculate remaining years, months, and days
    years_remaining=$((seconds_remaining / 31536000))
    months_remaining=$(((seconds_remaining % 31536000) / 2628000))
    days_remaining=$((((seconds_remaining % 31536000) % 2628000) / 86400))

    echo "You have $years_remaining years, $months_remaining months, and $days_remaining days remaining until you reach the age of 67."
  fi
}

# Main section
main() {
  calculate_remaining_age
}

# Execute the main section
main
