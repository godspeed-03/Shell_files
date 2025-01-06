#!/bin/bash

# Define directories for specific keywords
case "$1" in

# Deltacubes
"dc")
    dir="/run/media/satyam/Database/Deltacubes_Projects/"
    ;;
"dcbk")
    dir="/run/media/satyam/Database/Deltacubes_Projects/EventDTL-Backend/"
    ;;


# Flable Ai projects
"flable")
    dir="/run/media/satyam/Database/Flable/"
    ;;
"fbdash")
    dir="/run/media/satyam/Database/Flable/new_dashboard/"
    ;;
"fbapi")
    dir="/run/media/satyam/Database/Flable/new_dashboardapi/"
    ;;


# C++ coding/ DSA
"cpp")
    dir="/run/media/satyam/Database/Programming_Cpp/"
    ;;


# Projects
"portp")
    dir="/run/media/satyam/Database/Web_Projects/Portfolio/"
    ;;
"shopp")
    dir="/run/media/satyam/Database/Web_Projects/Shop/"
    ;;
"blogp")
    dir="/run/media/satyam/Database/Web_Projects/Blog/"
    ;;
"admin")
    dir="/run/media/satyam/Database/Web_Projects/AdminPanel/"
    ;;


# Web Learning
"web")
    dir="/run/media/satyam/Database/Web_Learning_Module/"
    ;;
"webk")
    dir="/run/media/satyam/Database/Web_Learning_Module/Backend/"
    ;;


# Others    
"shell")
    dir="/run/media/satyam/Database/Shell_files/"
    ;;
*)
    echo "Unknown keyword. Please use a predefined keyword."
    exit 1
    ;;
esac

# Open VS Code in the directory
if [ -d "$dir" ]; then
    code "$dir"
else
    echo "Directory not found: $dir"
    exit 1
fi
