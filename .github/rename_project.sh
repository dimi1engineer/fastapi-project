#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="dimi1engineer"
original_name="fastapi_project"
original_urlname="fastapi-project"
original_description="Awesome fastapi_project created by dimi1engineer"
# for filename in $(find . -name "*.*") 
for filename in $(git ls-files) 
do
    sed -i "s/$original_author/$author/gI" $filename
    sed -i "s/$original_name/$name/gI" $filename
    sed -i "s/$original_urlname/$urlname/gI" $filename
    sed -i "s/$original_description/$description/gI" $filename
    echo "Renamed $filename"
done

mv fastapi_project $name

# This command runs only once on GHA!
rm -rf .github/template.yml
