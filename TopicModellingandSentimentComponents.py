import pandas as pd
family_df = pd.read_csv("./Stored_Dataframes/family_related_tweetdf.csv")
del family_df["Unnamed: 0"]
del family_df["Unrelated"]
del family_df["Family_Related"] # These are either useless or known

f=open('LIWC2007_English080730_Edit.txt', encoding="utf8")
f1= f.readlines()
dimensions={}

for x in f1[1:]:
    if (x!='%\n'):
        dimensions[int(x.split("\t")[0])]= x.split("\t")[1].split('\n')[0]
    else:
        break
dimensions

words={}

for x in range(77,len(f1)):
    dim=[]
    j= f1[x].split('\t')
    for l in range(1,len(j)):
        if(l==len(j)-1):
               dim.append(j[l].split('\n')[0])
        else:
               dim.append(j[l])
    words[j[0].split('*')[0]]=dim

def sentiments(sentence, dims, words):
    word_sentiments = []
    for key in words:
        if key in sentence and key not in ['like', 'kind']:
            for dim in words[key]:
                print("{}, {}".format(key, dim))
                word_sentiments.append(dims[int(dim)])
    return word_sentiments
    
family_df['tweet_sentiments'] = family_df['clean_text'].apply(sentiments, args=(dimensions, words)) 
