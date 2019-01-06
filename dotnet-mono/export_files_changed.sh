#!/usr/bin/env bash

remote_branch="origin/develop"
echo "remote branch: $remote_branch"
echo "current branch: $GIT_BRANCH"
current_dir=${PWD##*/}
echo "current directory: $current_dir"
current_sha=$(git rev-parse HEAD)
echo "current sha: $current_sha"

# if the branch is develop, compare to the nearest parent,
# otherwise use the remote develop branch
if [[ ${GIT_BRANCH} =~ develop ]]; then
    echo "Checking files on merge"
    diff=$(git diff --name-only ${current_sha}^1..${current_sha})
else
    echo "Checking files on pull request"
    compare_sha=$(git log -n 1 ${remote_branch} --pretty=format:"%H")
    echo "compare sha: $compare_sha"
    diff=$(git diff --name-only ${current_sha} ${compare_sha})
fi

files_changed=$(echo ${diff} | grep ${current_dir})
num_files_changed=$(echo ${diff} | grep -o ${current_dir} | wc -l)
echo "$num_files_changed files have changed in $current_dir directory"
echo -e "files changed:\n$files_changed"
cf_export FILES_CHANGED="$num_files_changed"
