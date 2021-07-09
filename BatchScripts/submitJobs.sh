#!  /bin/bash
#FILES="./executionFiles/*"
#for f in $FILES
i=200
while [ $i -ne 351 ]
do
        sbatch --nodes=1 --time=12:00:00 --mem=256G ./executionFiles/executionfile$i.sh
	i=$(($i+1))
done
