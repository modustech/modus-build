#!/bin/sh
set -o xtrace
tag=$1

# Create release
data="{
    \"tag_name\": \"$tag\",
    \"name\": \"$tag\",
    \"body\": \"release $tag\",
    \"draft\": false,
    \"prerelease\": false
}"
echo $data | curl -X POST -H "Authorization: token $GITHUB_TOKEN" -d @- \
    https://api.github.com/repos/$GITHUB_REPOSITORY/releases