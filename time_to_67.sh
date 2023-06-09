#!/bin/bash

calculate_remaining_age() {
    local birthday="$1"

    # Calculate the current date and time
    local current_date=$(date +%F)

    # Calculate the difference between the current date and the birthday
    local years=$(date -d "$current_date" +%Y)     # Current year
    local months=$(date -d "$current_date" +%m)    # Current month
    local days=$(date -d "$current_date" +%d)      # Current day

    # Extract the year, month, and day from the birthday
    local birth_year=$(date -d "$birthday" +%Y)
    local birth_month=$(date -d "$birthday" +%m)
    local birth_day=$(date -d "$birthday" +%d)

    # Calculate the remaining years, months, and days until age 67
    local target_year=$((birth_year + 67))
    local target_date="$target_year-$birth_month-$birth_day"

    if [[ "$current_date" > "$target_date" ]]; then
        echo "You have already reached the age of 67."
    else
        local remaining_years=$((target_year - years))
        local remaining_months=$((birth_month - months))
        local remaining_days=$((birth_day - days))

        if [[ $remaining_months -lt 0 ]]; then
            remaining_years=$((remaining_years - 1))
            remaining_months=$((remaining_months + 12))
        fi

        if [[ $remaining_days -lt 0 ]]; then
            remaining_months=$((remaining_months - 1))

            case $birth_month in
                01|03|05|07|08|10|12)
                    remaining_days=$((remaining_days + 31))
                    ;;
                04|06|09|11)
                    remaining_days=$((remaining_days + 30))
                    ;;
                02)
                    if (( birth_year % 4 == 0 && (birth_year % 100 != 0 || birth_year % 400 == 0) )); then
                        remaining_days=$((remaining_days + 29))
                    else
                        remaining_days=$((remaining_days + 28))
                    fi
                    ;;
            esac
        fi

        echo "You have $remaining_years years, $remaining_months months, and $remaining_days days remaining until you reach the age of 67."
    fi
}

# Read the user's birthday in the format: YYYY-MM-DD
read -p "Enter your birthday (YYYY-MM-DD): " birthday

calculate_remaining_age "$birthday"
