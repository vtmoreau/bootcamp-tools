#! /bin/bash

NOCOLOR='\033[0m'
LIGHTRED='\033[1;31m'
RED='\033[0;31m'
GREEN='\033[0;32m'

flag=0
user=$(gh api user | jq -r '.login')
repo=$(basename "$(pwd)")

if ! pwd | grep -q ~/code/"${user}/data-"; then
    echo '⚠️ This does not look like a challenge directory'
    echo "Your challenges should be in ~/code/${user}/" 
    exit 2
fi

if [ -d .git ]; then
    echo 'Git Repository ✅'
    if [ -n "$(git remote -v)" ]; then
        echo 'Remote created ✅'
    else
        echo 'Remote missing ❌'
        flag=$((flag+1))
    fi
else
    echo 'Not a Git Repository ❌'
    flag=$((flag+1))
fi

if git ls-remote "git@github.com:${user}/${repo}.git" > /dev/null 2>&1; then 
    echo 'GitHub Repo created ✅';
else
    echo 'GitHub Repo missing ❌'
    flag=$((flag+1))
fi

if [ "$flag" -gt 0 ]; then
    echo "${LIGHTRED}Something is wrong, let's start again 💪"
    echo "${NOCOLOR}This command helps: ${RED}cd ../ && rm -r ${repo}"
    exit 1
else
    echo -e "${GREEN} Everything is fine, you can start your challenge 🚀"
    exit 0
fi
