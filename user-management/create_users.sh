#!/bin/bash

# User Management Script
# Run as root or with sudo

echo "===== Linux User Management Tool ====="
echo "1. Create User"
echo "2. Delete User"
echo "3. Reset Password"
echo "4. Add User to Group"
echo "5. Lock User"
echo "6. Unlock User"
echo "7. Exit"
echo "======================================"

read -p "Choose an option: " option

case $option in

1)
    read -p "Enter username to create: " username
    sudo useradd -m $username
    sudo passwd $username
    echo "User $username created successfully."
    ;;

2)
    read -p "Enter username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted."
    ;;

3)
    read -p "Enter username to reset password: " username
    sudo passwd $username
    echo "Password reset for $username."
    ;;

4)
    read -p "Enter username: " username
    read -p "Enter group name: " group
    sudo usermod -aG $group $username
    echo "$username added to group $group."
    ;;

5)
    read -p "Enter username to lock: " username
    sudo usermod -L $username
    echo "User $username locked."
    ;;

6)
    read -p "Enter username to unlock: " username
    sudo usermod -U $username
    echo "User $username unlocked."
    ;;

7)
    echo "Exiting..."
    exit
    ;;

*)
    echo "Invalid option."
    ;;

esac
