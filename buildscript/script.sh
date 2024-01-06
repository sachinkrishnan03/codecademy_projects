#!/bin/bash
echo "Welcome Home Mate!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
echo "Ok"
for filename in source/*
do
echo  $filename
if [ "$filename" == "source/secretinfo.md" ]
then
echo "Copying with replacement" 
cp $filename build/.|sed -i 's/42/XX/g' build/secretinfo.md
else
echo "Copying" $filename
cp $filename build/.
fi
done
cd build/
echo "build version $version contains:"
ls
cd ..
else
echo "Please come back when you are ready mate"
fi