#!/bin/bash

# Define the list of display names and corresponding paths (backend)
declare -A folder_mapping
folder_mapping=(
    ["DeltaCubes"]="/run/media/satyam/Database/Deltacubes_Projects/"
    ["DeltaCubes Backend"]="/run/media/satyam/Database/Deltacubes_Projects/EventDTL-Backend/"

    ["Flable"]="/run/media/satyam/Database/Flable/"
    ["Flable Dashboard"]="/run/media/satyam/Database/Flable/new_dashboard/"
    ["Flable Dashboard API"]="/run/media/satyam/Database/Flable/new_dashboardapi/"

    ["C++ DSA"]="/run/media/satyam/Database/Programming_Cpp/"

    ["Portfolio"]="/run/media/satyam/Database/Web_Projects/Portfolio/"
    ["Shopping Project"]="/run/media/satyam/Database/Web_Projects/Shop/"
    ["Blog Project"]="/run/media/satyam/Database/Web_Projects/Blog/"
    ["Admin Project"]="/run/media/satyam/Database/Web_Projects/AdminPanel/"

    ["Web Learning"]="/run/media/satyam/Database/Web_Learning_Module/"
    ["Web Learning Backend"]="/run/media/satyam/Database/Web_Learning_Module/Backend/"

    ["Shell Scripts"]="/run/media/satyam/Database/Shell_files/"
)

# Generate the list of display names (keys) and quote each label
display_list=$(for name in "${!folder_mapping[@]}"; do echo "$name"; done | sort)

# Show an input dialog with rofi, making it transparent and colorful
keyword=$(echo "$display_list" | rofi -dmenu -p "Select a project" -mesg "Choose one from the list" \
    -theme-str 'window { background-color: transparent; width: 50%; color:#ffffff; }' \
    -theme-str 'mainbox { background-color: rgba(0, 0, 0, 0.3); }' \
    -theme-str 'element { background-color: rgba(0, 0, 0, 0.4); color: #ffffff; padding: 8px; }' \
    # -theme-str 'element:selected { background-color: #81A1C1; color: #2E3440; }' \
    -theme-str 'inputbar { background-color: rgba(0, 0, 0, 0.5); color: #ffffff; }' \
    -theme-str 'textbox { color: #ffffff; background-color: rgba(0, 0, 0, 0.5); }' \
    -theme-str 'listview {  padding: 10px; max-height: 60%; overflow: scroll; }' \
    -theme-str 'window { border-width: 2px; border-color: #81A1C1; }' \
)

# If a valid folder is selected, open it in VS Code
if [ ! -z "$keyword" ]; then
    # Get the corresponding path for the selected project
    folder_path="${folder_mapping[$keyword]}"
    
    # Check if the folder exists
    if [ -d "$folder_path" ]; then
        code "$folder_path"
    else
        notify-send "Error" "The folder for '$folder_path' does not exist."
    fi
fi
