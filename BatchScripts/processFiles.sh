# !/bin/bash

if [ ! -d "processingScripts" ]
then
    mkdir processingScripts
fi
if [ ! -d "savedDFs" ]
then
    mkdir savedDFs
fi
i=1
while [ $i -ne 351 ]
do
if [ $i -lt 10 ]
then
    name='corona_tweets_0'$i'_data.txt'
else
    name='corona_tweets_'$i'_data.txt'
fi
cat <<EOF >./processingScripts/processfile$i.py
import ast
import pandas as pd

# Opening JSON file
with open("$name", encoding='utf-8') as json_file:
    tweets = []
    for line in json_file:
        tweets.append(ast.literal_eval(line))
tweet_df_day$i = pd.DataFrame(tweets, columns = ['possibly_sensitive', 'entities', 'text', 'public_metrics', 'id', 'context_annotations', 'lang', 'in_reply_to_user_id', 'author_id', 'source', 'referenced_tweets', 'created_at', 'geo']) 
tweet_df_day$i.to_csv("./savedDFs/tweet_df_day$i.csv")
EOF
#sbatch --nodes=1 --time=24:00:00 --mem=64G ./processingScripts/processfile$i.py # for creating a job
i=$(($i+1))
done
