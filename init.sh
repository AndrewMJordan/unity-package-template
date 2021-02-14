#!/usr/bin/env bash

read -p 'Package Name: ' packageName
read -p 'Author: ' author

sed -i "s/<AUTHOR>/$author/g" LICENSE
sed -i "s/<AUTHOR>/$author/g" preamble.txt
mv "Project" "$packageName"
sed -i "s/productName: Test Package/productName: $packageName/g"
mv "$packageName/Assets/Package" "$packageName/Assets/$packageName"
mv "$packageName/Assets/Package.md" "$packageName/Assets/$packageName.md"
