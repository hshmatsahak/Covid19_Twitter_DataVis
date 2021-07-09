#!  /bin/bash
i=1
if [ ! -d "executionFiles" ]
then
    mkdir executionFiles
fi
while [ $i -ne 351 ]
do
cat <<EOF >./executionFiles/executionfile$i.sh
#! /bin/bash
python ./processingScripts/processfile$i.py
EOF
i=$(($i+1))
done
