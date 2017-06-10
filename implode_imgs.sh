#!/bin/bash

# path for store screenshots
imgPath='images'
# screenshots extension
imgExt='png'

# check existanse
if [ ! -d $imgPath ]
then
    mkdir $imgPath
    echo "Dirrectory $imgPath just created. Put screenshots there"
    exit
fi

cd $imgPath

# check not empty
if [ $(ls | wc -w) -eq 0 ]
then
    echo "Dirrectory $imgPath has no screenshots"
    exit
fi

images=$(find . -regextype sed -regex ".*/[^result]*\.$imgExt" | sort -n)
cnt=$(echo $images | wc -w)

# imagemagick library function
montage $images -geometry +0+0 -tile 1x$cnt result_$(date +"%Y_%m_%d_%H_%M_%S").$imgExt

echo 'Done'
