#!/bin/bash

hugo -D
cp -r public/* ../

cd ..
git add .
git commit -m "Update content"
git push origin master
