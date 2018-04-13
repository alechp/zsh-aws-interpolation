# To get started: 
# export currentUserPoolId='us-region-index_ABCDefg1H'

cidpDeleteUser="aws cognito-idp admin-delete-user"
cidpListUsers="aws cognito-idp list-users"
userPoolId="--user-pool-id ${currentUserPoolId}"

# User Prompt
read -p "Would you like to (L)ist Users or (D)elete a specific user? " cidpAction

function cognitoDelete() {
  read -p "What's the username? " username
  local concat="${cidpDeleteUser} ${userPoolId} --username ${username}"
  echo $concat
}

function cognitoList(){
  local concat="${cidpListUsers} ${userPoolId}"
  echo $concat
}

function getResults() { 
  case $cidpAction in
    "L" | "l") 
      cognitoList
      ;;
    "D" | "d")
      cognitoDelete
  esac
}


# Copy to clipboard and then print to terminal
cognitoResults=$(getResults)
echo "$cognitoResults" | pbcopy

echo "\n-------------------------"
echo "Copied to your clipboard:"
echo "-------------------------"
echo "\n $cognitoResults"
