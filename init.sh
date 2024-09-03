#!/bin/bash

read -p "Enter project name: " project
read -p "Enter title: " title
read -p "Enter author: " author
git clone git@github.com:MHenderson/paper-template.git $project
cd $project
sed -i -e "s/paper/$project/g" Makefile
rm Makefile-e
mv src/paper-draft.tex src/$project-draft.tex
mv src/paper.tex src/$project.tex
sed -i -e "s/Title Goes Here/$title/g" src/$project-draft.tex
sed -i -e "s/Author Goes Here/$author/g" src/$project-draft.tex
sed -i -e "s/Title Goes Here/$title/g" src/$project.tex
sed -i -e "s/Author Goes Here/$author/g" src/$project.tex
rm src/$project.tex-e
rm src/$project-draft.tex-e
rm src/main.tex
touch src/main.tex
echo "# "$project > README.md
make count
rm -rf .git
rm NEWS.md
git init
git switch --create main
git add --all -- :!init.sh
git commit -m "Initial commit based on paper-template v0.1.0."
rm init.sh
