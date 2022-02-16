#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')
import re
import time
from datetime import datetime
import matplotlib.dates as mdates
import matplotlib.ticker as ticker
from urllib.request import urlopen
from bs4 import BeautifulSoup
import requests


# In[50]:


import requests
from bs4 import BeautifulSoup as bs

urls = ['https://www.yelp.com/biz/thursday-kitchen-new-york?osq=Restaurants',
        'https://www.yelp.com/biz/the-cabin-nyc-new-york-2?osq=Restaurants',
        'https://www.yelp.com/biz/am%C3%A9lie-new-york?osq=Restaurants',
        'https://www.yelp.com/biz/the-osprey-brooklyn?osq=Restaurants',
        'https://www.yelp.com/biz/sunday-in-brooklyn-brooklyn-3?osq=Restaurants',
        'https://www.yelp.com/biz/brothers-pizzeria-bronx?osq=Brothers+Pizzeria',
        'https://www.yelp.com/biz/little-caesars-pizza-bronx-7?osq=Little+Caesars+Pizza',
        'https://www.yelp.com/biz/rafaelina-restaurant-bar-bronx',
        'https://www.yelp.com/biz/wendys-wichita-2?osq=Wendy',
        'https://www.yelp.com/biz/sonic-drive-in-bonner-springs?osq=Sonic+Drive-In',]
data = {}
for url in urls :
    r=requests.get(url)
    soup=bs(r.content,'html.parser')
    value = soup.find_all('span',class_='raw__373c0__3rcx7')
    review_list=[]
    for i in range(0, len(value)):
        review_list.append(value[i].get_text())
    soup=BeautifulSoup(r.text)
    restraunt_name = soup.h1.string
    data[restraunt_name] = review_list

data
    


# In[51]:



data.keys()


# In[52]:


data['Rafaelina Restaurant Bar'][:5]


# In[53]:


#Cleaning The Data


# In[54]:


next(iter(data.keys()))


# In[55]:


next(iter(data.values()))


# In[56]:


def combine_text(list_of_text):
    combined_text = ' '.join(list_of_text)
    return combined_text


# In[57]:


#for key in data.keys():
#    clean_value = data[key]
#    print(clean_value)
#    clean_value_string = combine_text(clean_value)
#   data[key] = clean_value_string
#data


# In[58]:


data_combined = {key:[combine_text(value)]
                 for (key,value) in data.items()}
data_combined


# In[59]:


import pandas as pd
pd.set_option('max_colwidth',150)

data_df = pd.DataFrame.from_dict(data_combined).transpose()
data_df.columns = ['transcript']
data_df = data_df.sort_index()
data_df


# In[60]:


# Let's take a look at the transcript for thursday kitchen
data_df.transcript.loc['Thursday Kitchen']


# In[61]:


# Apply a first round of text cleaning techniques
import re
import string

def clean_text_round1(text):
    '''Make text lowercase, remove text in square brackets, remove punctuation and remove words containing numbers.'''
    text = text.lower()
    text = re.sub('\[.*?\]', '', text)
    text = re.sub('[%s]' % re.escape(string.punctuation), '', text)
    text = re.sub('\w*\d\w*', '', text)
    return text

round1 = lambda x: clean_text_round1(x)

#for key in data.keys():
 #   round1=data[key]
  #  print(round1)
   # clean_value_round1 = clean_text_round1(round1)
   # data[key] = clean_value_round1
   # print(clean_value_round1)///


# In[62]:


data_df


# In[63]:


# Let's take a look at the updated text
#data_df = pd.DataFrame.from_dict(data_combined).transpose()
#data_df
data_clean = pd.DataFrame(data_df.transcript.apply(round1))
data_clean


# In[64]:


# Apply a second round of cleaning
def clean_text_round2(text):
    '''Get rid of some additional punctuation and non-sensical text that was missed the first time around.'''
    text = re.sub('[‘’“”…]', '', text)
    text = re.sub('\n', '', text)
    return text

round2 = lambda x: clean_text_round2(x)

#for key in data.keys():
#    round2=data[key]
#    clean_value_round2 = clean_text_round2(round2)
#    data[key] = clean_value_round2
#    print(clean_value_round2)


# In[65]:


# Let's take a look at the updated text
data_clean = pd.DataFrame(data_clean.transcript.apply(round2))
data_clean


# In[66]:


## Organizing The Data


# In[67]:


### Corpus


# In[68]:


### Document-Term Matrix


# In[69]:


# We are going to create a document-term matrix using CountVectorizer, and exclude common English stop words
from sklearn.feature_extraction.text import CountVectorizer

cv = CountVectorizer(stop_words='english')
data_cv = cv.fit_transform(data_clean.transcript)
data_dtm = pd.DataFrame(data_cv.toarray(), columns=cv.get_feature_names())
data_dtm.index = data_clean.index
data_dtm


# In[70]:


# Exploratory Data Analysis


# In[71]:


# Read in the document-term matrix
data=data_dtm.transpose()
data.head()


# In[72]:


# Find the top 30 words said by each reviews
top_dict = {}
for c in data.columns:
    top = data[c].sort_values(ascending=False).head(30)
    top_dict[c]= list(zip(top.index, top.values))

top_dict


# In[73]:


# Print the top 15 words said by each reviews
for resturant, top_words in top_dict.items():
    print(resturant)
    print(', '.join([word for word, count in top_words[0:14]]))
    print('---')


# In[74]:


# Look at the most common top words
from collections import Counter
words = []
for resturant in data.columns:
    top = [word for (word, count) in top_dict[resturant]]
    for t in top:
        words.append(t)
        
words


# In[75]:


# Let's aggregate this list and identify the most common words along with how many routines they occur in
Counter(words).most_common()


# In[76]:


# Let's make some word clouds!
# Terminal / Anaconda Prompt: conda install -c conda-forge wordcloud
from wordcloud import WordCloud
wc = WordCloud(background_color="white", colormap="Dark2",
               max_font_size=150, random_state=42)


# In[77]:


# Reset the output dimensions
import matplotlib.pyplot as plt

plt.rcParams['figure.figsize'] = [16, 6]


resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]

# Create subplots for each restrurant
for index, resturant in enumerate(data.columns):
    wc.generate(data_clean.transcript[resturant])
    
    plt.subplot(3, 4, index+1)
    plt.imshow(wc, interpolation="bilinear")
    plt.axis("off")
    plt.title(resturant_names[index])
    
plt.show()


# In[78]:


# Find the number of unique words that each resturants uses

# Identify the non-zero items in the document-term matrix, meaning that the word occurs at least once
unique_list = []
for resturant in data.columns:
    uniques = data[resturant].to_numpy().nonzero()[0].size
    unique_list.append(uniques)

# Create a new dataframe that contains this unique word count
data_words = pd.DataFrame(list(zip(resturant_names, unique_list)), columns=['', 'unique_words'])
data_unique_sort = data_words.sort_values(by='unique_words')
data_unique_sort


# In[79]:


# Find the total number of words that a resturant uses
total_list = []
for resturant in data.columns:
    totals = sum(data[resturant])
    total_list.append(totals)
    
resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]
star_rating = [4.5, 4, 4.5, 4, 4, 1.5, 1.5, 1.5, 1.5, 1.5]
number_of_reviews = [1390, 277, 2721, 232, 870, 10, 9, 21, 12, 10]

# Let's add some columns to our dataframe
data_words['total_words'] = total_list
data_words


# In[ ]:





# In[80]:


import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
star_rating = [4.5, 4, 4.5, 4, 4, 1.5, 1.5, 1.5, 1.5, 1.5]
number_of_reviews = [1390, 277, 2721, 232, 870, 10, 9, 21, 12, 10]
resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]
ax.bar(resturant_names,star_rating)
plt.show()


# In[35]:


import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])

resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]
star_rating = [4.5, 4, 4.5, 4, 4, 1.5, 1.5, 1.5, 1.5, 1.5]
number_of_reviews = [1390, 277, 2721, 232, 870, 10, 9, 21, 12, 10]

ax.bar(resturant_names,number_of_reviews)
plt.show()


# In[36]:


from matplotlib import pyplot as plt
import numpy as np
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.axis('equal')
star_rating = [4.5, 4, 4.5, 4, 4, 1.5, 1.5, 1.5, 1.5, 1.5]
number_of_reviews = [1390, 277, 2721, 232, 870, 10, 9, 21, 12, 10]
resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]
ax.pie(number_of_reviews, labels = resturant_names,autopct='%1.2f%%')
plt.show()


# In[37]:


# Let's plot our findings
import numpy as np

y_pos = np.arange(len(data_words))

plt.subplot(1, 2, 1)
plt.barh(y_pos, data_unique_sort.unique_words, align='center')
plt.yticks(y_pos, data_unique_sort.resturant_names)
plt.title('Number of Unique Words', fontsize=20)
plt.tight_layout()
plt.show()


# In[38]:


### Amount of Profanity


# In[39]:


#  Let's take a look at the most common words again.
Counter(words).most_common()


# In[48]:


# Let's isolate just these bad words
data_offensive_words = data.transpose()[['shit', 'suck']]

data_profanity = pd.concat([ data_offensive_words.shit + data_offensive_words.suck ], axis=1)
data_profanity.columns = ['offensive_words']
data_profanity


# In[58]:


# Let's isolate just these bad words
data_bad_words = data.transpose()[['small','wait', 'time', 'little', 'cold', 'weird']]

data_pro_negative = pd.concat([data_bad_words.small + data_bad_words.wait + data_bad_words.time + data_bad_words.little + data_bad_words.cold 
                            +data_bad_words.weird], axis=1)
data_pro_negative.columns = ['bad_words']
data_pro_negative


# In[59]:


# Let's isolate just these positive words
data_pos_words = data.transpose()[['great','good', 'like', 'amazing', 'delicious', 'love', 'best','beautiful','recommend','new',
                                  'enjoyed','glad','happy','interesting','perfectly','pretty','warm','loved','better','incredible']]

data_pro_positive = pd.concat([data_pos_words.great + data_pos_words.good + data_pos_words.like + data_pos_words.amazing + data_pos_words.delicious 
                            + data_pos_words.love + data_pos_words.best + data_pos_words.beautiful +data_pos_words.recommend+data_pos_words.new +
                           data_pos_words.enjoyed + data_pos_words.glad + data_pos_words.happy + data_pos_words.interesting + data_pos_words.perfectly
                            + data_pos_words.pretty+ data_pos_words.warm+ data_pos_words.loved+ data_pos_words.better+ data_pos_words.incredible], axis=1)

data_pro_positive.columns = ['positive_words']
data_pro_positive


# In[ ]:





# In[ ]:





# In[60]:


## Sentiment of Routine


# In[61]:


data_df


# In[ ]:





# In[62]:


# Create quick lambda functions to find the polarity and subjectivity of each routine
# Terminal / Anaconda Navigator: conda install -c conda-forge textblob
from textblob import TextBlob

pol = lambda x: TextBlob(x).sentiment.polarity
sub = lambda x: TextBlob(x).sentiment.subjectivity
resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]

data_df['polarity'] = data_df['transcript'].apply(pol)
data_df['subjectivity'] = data_df['transcript'].apply(sub)
data_df


# In[63]:


data_df.keys()
resturant_names = ['Thursday Kitchen', 'The Cabin NYC', 'Amélie', 'The Osprey', 'Sunday in Brooklyn', 'Brothers Pizzeria', 'Little Caesars Pizza', 'Rafaelina Restaurant Bar', "Wendy's", 'Sonic Drive-In' ]


# In[80]:


# Let's plot the results
import matplotlib.pyplot as plt

plt.rcParams['figure.figsize'] = [8, 8]

for index, resturant in enumerate(data_df.index):
    x = data_df.polarity.loc[resturant]
    y = data_df.subjectivity.loc[resturant]
    plt.scatter(x, y, color='blue')
    plt.text(x+.001, y+.001,resturant_names[index] , fontsize=10)
    plt.xlim(-.1, 0.8) 
    
plt.title('Sentiment Analysis', fontsize=20)
plt.xlabel('<-- Negative -------- Positive -->', fontsize=15)
plt.ylabel('<-- Facts -------- Opinions -->', fontsize=15)

plt.show()


# In[65]:


# Split each routine into 10 parts
import numpy as np
import math

def split_text(text, n=10):
    '''Takes in a string of text and splits into n equal parts, with a default of 10 equal parts.'''

    # Calculate length of text, the size of each chunk of text and the starting points of each chunk of text
    length = len(text)
    size = math.floor(length / n)
    start = np.arange(0, length, size)
    
    # Pull out equally sized pieces of text and put it into a list
    split_list = []
    for piece in range(n):
        split_list.append(text[start[piece]:start[piece]+size])
    return split_list


# In[66]:


data_df


# In[83]:


# Let's create a list to hold all of the pieces of text
list_pieces = []
for t in data_df.transcript:
    split = split_text(t)
    list_pieces.append(split)
    
list_pieces


# In[84]:


# The list has 10 elements, one for each transcript
len(list_pieces)


# In[85]:


# Each transcript has been split into 10 pieces of text
len(list_pieces[0])


# In[86]:


# Calculate the polarity for each piece of text

polarity_transcript = []
for lp in list_pieces:
    polarity_piece = []
    for p in lp:
        polarity_piece.append(TextBlob(p).sentiment.polarity)
    polarity_transcript.append(polarity_piece)
    
polarity_transcript


# In[87]:


# Show the plot for one resturant
plt.plot(polarity_transcript[0])
plt.title(resturant_names[index])
plt.show()


# In[88]:


# Show the plot for all resturant
plt.rcParams['figure.figsize'] = [16, 12]

for index, resturant in enumerate(data_df.index):    
    plt.subplot(3, 4, index+1)
    plt.plot(polarity_transcript[index])
    plt.plot(np.arange(0,10), np.zeros(10))
    plt.title(resturant_names[index])
    plt.ylim(ymin=-.2, ymax=.3)
    
plt.show()


# In[89]:


#Topic Modeling 


# In[90]:


# Import the necessary modules for LDA with gensim
# Terminal / Anaconda Navigator: conda install -c conda-forge gensim
from gensim import matutils, models
import scipy.sparse

import logging
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)


# In[91]:


# One of the required inputs is a term-document matrix
tdm = data_dtm.transpose()
tdm.head()


# In[92]:


# We're going to put the term-document matrix into a new gensim format, from df --> sparse matrix --> gensim corpus
sparse_counts = scipy.sparse.csr_matrix(tdm)
corpus = matutils.Sparse2Corpus(sparse_counts)


# In[93]:


# Gensim also requires dictionary of the all terms and their respective location in the term-document matrix

id2word = dict((v, k) for k, v in cv.vocabulary_.items())


# In[94]:


# Now that we have the corpus (term-document matrix) and id2word (dictionary of location: term),
# we need to specify two other parameters as well - the number of topics and the number of passes
lda = models.LdaModel(corpus=corpus, id2word=id2word, num_topics=2, passes=10)
lda.print_topics()


# In[95]:


# LDA for num_topics = 3
lda = models.LdaModel(corpus=corpus, id2word=id2word, num_topics=3, passes=10)
lda.print_topics()


# In[96]:


# LDA for num_topics = 4
lda = models.LdaModel(corpus=corpus, id2word=id2word, num_topics=4, passes=10)
lda.print_topics()


# In[97]:


## Topic Modeling - Attempt #2 (Nouns Only)


# In[98]:


# Let's create a function to pull out nouns from a string of text
from nltk import word_tokenize, pos_tag

def nouns(text):
    '''Given a string of text, tokenize the text and pull out only the nouns.'''
    is_noun = lambda pos: pos[:2] == 'NN'
    tokenized = word_tokenize(text)
    all_nouns = [word for (word, pos) in pos_tag(tokenized) if is_noun(pos)] 
    return ' '.join(all_nouns)


# In[99]:


# Read in the cleaned data, before the CountVectorizer step

data_clean


# In[100]:


# Apply the nouns function to the transcripts to filter only on nouns
import nltk
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
data_nouns = pd.DataFrame(data_clean.transcript.apply(nouns))
data_nouns


# In[101]:


# Create a new document-term matrix using only nouns
from sklearn.feature_extraction import text
from sklearn.feature_extraction.text import CountVectorizer

# Re-add the additional stop words since we are recreating the document-term matrix
add_stop_words = ['like', 'im', 'know', 'just', 'dont', 'thats', 'right', 'people',
                  'youre', 'got', 'gonna', 'time', 'think', 'yeah', 'said','just','cecconis','restaurant','wendys','sunday' ]
stop_words = text.ENGLISH_STOP_WORDS.union(add_stop_words)

# Recreate a document-term matrix with only nouns
cvn = CountVectorizer(stop_words=stop_words)
data_cvn = cvn.fit_transform(data_nouns.transcript)
data_dtmn = pd.DataFrame(data_cvn.toarray(), columns=cvn.get_feature_names())
data_dtmn.index = data_nouns.index
data_dtmn


# In[102]:


# Create the gensim corpus
corpusn = matutils.Sparse2Corpus(scipy.sparse.csr_matrix(data_dtmn.transpose()))

# Create the vocabulary dictionary
id2wordn = dict((v, k) for k, v in cvn.vocabulary_.items())


# In[103]:


# Let's start with 2 topics
ldan = models.LdaModel(corpus=corpusn, num_topics=2, id2word=id2wordn, passes=10)
ldan.print_topics()


# In[104]:


# Let's try topics = 3
ldan = models.LdaModel(corpus=corpusn, num_topics=3, id2word=id2wordn, passes=10)
ldan.print_topics()


# In[105]:


# Let's try 4 topics
ldan = models.LdaModel(corpus=corpusn, num_topics=4, id2word=id2wordn, passes=10)
ldan.print_topics()


# In[106]:


## Topic Modeling - Attempt #3 (Nouns and Adjectives)


# In[107]:


# Let's create a function to pull out nouns from a string of text
def nouns_adj(text):
    '''Given a string of text, tokenize the text and pull out only the nouns and adjectives.'''
    is_noun_adj = lambda pos: pos[:2] == 'NN' or pos[:2] == 'JJ'
    tokenized = word_tokenize(text)
    nouns_adj = [word for (word, pos) in pos_tag(tokenized) if is_noun_adj(pos)] 
    return ' '.join(nouns_adj)


# In[108]:


# Apply the nouns function to the transcripts to filter only on nouns
data_nouns_adj = pd.DataFrame(data_clean.transcript.apply(nouns_adj))
data_nouns_adj


# In[109]:


# Create a new document-term matrix using only nouns and adjectives, also remove common words with max_df
cvna = CountVectorizer(stop_words=stop_words, max_df=.8)
data_cvna = cvna.fit_transform(data_nouns_adj.transcript)
data_dtmna = pd.DataFrame(data_cvna.toarray(), columns=cvna.get_feature_names())
data_dtmna.index = data_nouns_adj.index
data_dtmna


# In[110]:


# Create the gensim corpus
corpusna = matutils.Sparse2Corpus(scipy.sparse.csr_matrix(data_dtmna.transpose()))

# Create the vocabulary dictionary
id2wordna = dict((v, k) for k, v in cvna.vocabulary_.items())


# In[111]:


# Let's start with 2 topics
ldana = models.LdaModel(corpus=corpusna, num_topics=2, id2word=id2wordna, passes=10)
ldana.print_topics()


# In[112]:


# Let's try 3 topics
ldana = models.LdaModel(corpus=corpusna, num_topics=3, id2word=id2wordna, passes=10)
ldana.print_topics()


# In[113]:


# Let's try 4 topics
ldana = models.LdaModel(corpus=corpusna, num_topics=4, id2word=id2wordna, passes=10)
ldana.print_topics()


# In[114]:


## Identify Topics in Each Document


# In[115]:


# Our final LDA model (for now)
ldana = models.LdaModel(corpus=corpusna, num_topics=4, id2word=id2wordna, passes=80)
ldana.print_topics()


# In[116]:


#These four topics look pretty decent. Let's settle on these for now.
#Topic 0: snacks
# Topic 1: interior
#Topic 2: food
# Topic 3: branch


# In[69]:


# Let's take a look at which topics each transcript contains
corpus_transformed = ldana[corpusna]
list(zip([a for [(a,b)] in corpus_transformed], data_dtmna.index))


# In[70]:


#These four topics look pretty decent. Let's settle on these for now.
#Topic 0: snacks [1803,Amélie ]
# Topic 1: interior [Cecconi's Dumbo,The Osprey]
#Topic 2: food[Benemon,Thursday Kitchen]
# Topic 3: branch[Sunday in Brooklyn',While We Were Young,The Cabin NYC]


# In[71]:


# Text Generation


# In[72]:


data_clean


# In[73]:


# Extract only Thrusday Kitchen text
tk_text = data_clean.transcript.loc['Thursday Kitchen']
tk_text[:200]


# In[74]:


## Build a Markov Chain Function


# In[75]:


from collections import defaultdict

def markov_chain(text):
    '''The input is a string of text and the output will be a dictionary with each word as
       a key and each value as the list of words that come after the key in the text.'''
    
    # Tokenize the text by word, though including punctuation
    words = text.split(' ')
    
    # Initialize a default dictionary to hold all of the words and next words
    m_dict = defaultdict(list)
    
    # Create a zipped list of all of the word pairs and put them in word: list of next words format
    for current_word, next_word in zip(words[0:-1], words[1:]):
        m_dict[current_word].append(next_word)

    # Convert the default dict back into a dictionary
    m_dict = dict(m_dict)
    return m_dict


# In[76]:


# Create the dictionary for thrusday Kitchen routine, take a look at it
tk_dict = markov_chain(tk_text)
tk_dict


# In[77]:


## Create a Text Generator


# In[78]:


import random

def generate_sentence(chain, count=15):
    '''Input a dictionary in the format of key = current word, value = list of next words
       along with the number of words you would like to see in your generated sentence.'''

    # Capitalize the first word
    word1 = random.choice(list(chain.keys()))
    sentence = word1.capitalize()

    # Generate the second word from the value list. Set the new word as the first word. Repeat.
    for i in range(count-1):
        word2 = random.choice(chain[word1])
        word1 = word2
        sentence += ' ' + word2

    # End it with a period
    sentence += '.'
    return(sentence)


# In[186]:


generate_sentence(tk_dict)


# In[187]:


# Extract only Little Caesars Pizza  text
lP_text = data_clean.transcript.loc['Little Caesars Pizza']
lP_text[:200]


# In[188]:


# Create the dictionary for Little Caesars Pizza , take a look at it
lp_dict = markov_chain(lP_text)
lp_dict


# In[189]:


generate_sentence(lp_dict)


# In[ ]:




