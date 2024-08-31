#!/bin/bash

while true; do
    clear
    echo "==========================================="
    echo "             CasaOS Management             "
    echo "==========================================="
    echo "1. Install CasaOS"
    echo "2. Update CasaOS"
    echo "3. Change CasaOS Port"
    echo "4. Uninstall CasaOS"
    echo "5. Back to Menu"    
    echo "6. Exit"

    echo "==========================================="
    read -p "Select an option [1-6]: " option

    case $option in
        1)
            echo "Installing CasaOS..."
            curl -fsSL https://get.casaos.io | sudo bash
            read -p "Press [Enter] to return to menu..."
            ;;
        2)
            echo "Updating CasaOS..."
            curl -fsSL https://get.casaos.io/update | sudo bash
            read -p "Press [Enter] to return to menu..."
            ;;
        3)
            echo "Changing CasaOS Port..."
            bash -c "$(wget -qLO - https://raw.githubusercontent.com/bigbeartechworld/big-bear-scripts/master/edit-casaos-apps/run.sh)"
            read -p "Press [Enter] to return to menu..."
            ;;
        4)
            echo "Uninstalling CasaOS..."
            sudo casaos-uninstall
            read -p "Press [Enter] to return to menu..."
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        5)
            echo "Returning to menu..."
            ;;
        *)
            echo "Invalid option, please try again."
            read -p "Press [Enter] to return to menu..."
            ;;
    esac
done
