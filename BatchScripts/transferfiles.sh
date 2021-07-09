i=320
while [ $i -ne 351 ]
    do
        i=$(($i+1))
        name="reda@cedar.computecanada.ca:~/scratch/twitter_covid19_data_processed/covid_19_tweets/corona_tweets_$i"_data.txt
        scp -i ~/reda_sshkey "$name" .
done
