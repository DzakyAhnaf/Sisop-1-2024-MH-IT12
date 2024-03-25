#!/bin/bash

##LOGIN SYSTEM##

login() {
    echo "Enter your email"
    read email
    
    if ! grep -q "^$email|" users.txt; then
        echo -e "Email not found. Please register first."
        return 1
  else
    echo "Enter the password"
    read -s password
    
    user_check=$(grep "^$email:" users.txt | cut -d '|' -f 2)
    encrypted_password=$(echo $password | base64)
    if grep -q "^$user_check:.*:.*:.*:$encrypted_password" users.txt; then
	echo -e "Login Successful"
	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$user_check] logged in successfully" >> auth.log
        admin_menu
    elif grep -q "^$user_check:.*:.*:.*:$encrypted_password" users.txt; then
    	echo -e "Login Successful"
    	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN SUCCESS] user [$user_check] logged in successfully" >> auth.log
    	member
    else
    	echo -e "Password incorrect. Enter again"
   	echo "$(date '+[%d%m%y %H:%M:%S]') [LOGIN FAILED] ERROR Failed login attempt on user with email [$email]" >> auth.log
   	return 1
     fi
  fi
}

forgot_password() {
    	echo "Enter your email"
    	read -r email
    	
    if grep -q "^$email:" users.txt; then
	echo -e "Email not found. Please register first."
        return 1
    else
    	security_question=$(grep "^$email:" users.txt | cut -d '|' -f 3)
        echo "Security Question : $security_question"
        
    	echo "Enter your answer:"
    	read -r answer_check
    if ! grep -q "^$email:.*:.*:answer_check" users.txt; then
        echo "Answer Incorrect. Try again"
        return 1
    else
    	encrypted_password=$(grep "^$email:" users.txt | cut -d '|' -f 5)
	password_check=$(echo $encrypted_password | base 64 -d)
    	echo "Your password is: $password_check"
    fi
 fi
}

member() {
	echo "Welcome Member!"
}
	
admin_menu() {
    while true; do
    echo "1. Add User"
    echo "2. Edit User"
    echo "3. Delete User"
    echo -e "4. Logout"
    
    echo "Choose Menu: "
    read admin_choice

    case $admin_choice in
        1) add_user ;;
        2) edit_user ;;
        3) delete_user ;;
        4) logout ;;
        *) echo "NOT VALID" ;;
    esac 
 done
}

add_user() {
    echo "Enter new email"
    read new_email
    if grep -q "^$new_email" users.txt; then
        echo "User with this email already exists. Please add another email."
        echo "$(date '+[%d%m%y %H:%M:%S]') [REGISTER FAILED] ERROR Failed register attempt on user with email [$email] >> auth.log
        return
    fi
    
    	if [[$email != "*@*.*"]]; then
    	echo -e "Email not valid"
    	echo "$(date '+[%d%m%y %H:%M:%S]') [REGISTER FAILED] ERROR Failed register attempt on user with email [$email] >> auth.log
    	echo " "
   	return
   fi

    echo "Enter new username"
    read new_username
    echo " "

    echo "Enter security question:"
    read security_question
    echo " "

    echo "Enter the security answer:"
    read new_answer
    echo " "
 
    echo "Enter password"
    read -s new_password
    echo " "

    encrypted_password=$(echo $new_password | base64)

    echo "$new_email|$new_username|$security_question|$new_answer|$encrypted_password" >> users.txt
    echo -e "NEW USER ADDED"
    echo "$(date '+[%d%m%y %H:%M:%S]') [REGISTER SUCCESS] user [$new_username] registered successfully" >> auth.log
}

edit_user() {
    echo "Enter the email to edit"
    read edit_email
    if ! grep -q "^$edit_email" users.txt; then
        echo "User with this email not found."
        echo " "
        return
  else
    echo "Enter new username"
    read edit_username
    echo " "

    echo "Enter new security question"
    read edit_question
    echo " "

    echo "Enter new security answer"
    read edit_answer
    echo " "

    echo "Enter new password"
    read -s edit_password
    echo " "

    newencrypted_password=$(echo $edit_password | base64)

    sed -i "/^$edit_email:/c\\$edit_email|$edit_username|$edit_question|$edit_answer|$encrypted_password" users.txt
    echo -e "USER EDIT UPDATED"
  fi
}

delete_user() {
    echo "Enter the email of user to delete"
    read delete_email
    if ! grep -q "^$delete_email" users.txt; then
        echo "User with this email not found."
        echo " "
        return
    else
    
    sed -i "/^$delete_email/:d" users.txt
    echo -e "USER DELETED SUCCESSFULLY"
  fi
}

logout() {
    echo "Logout Successfully!"
    exit 1
}


echo "=== Welcome to Login System ==="
echo " "
echo "1. Login"
echo "2. Forgot Password"
echo " "
echo "Choose Menu: "
read choice

case $choice in
    1) login ;;
    2) forgot_password ;;
    *) echo "NOT VALID" ;;
esac

date + %d%m%y %H:%M:%S
