# newsgroups

 The 20 Newsgroups data set is a collection of approximately 20,000 newsgroup documents, partitioned (nearly) evenly 
 across 20 different newsgroups. http://qwone.com/~jason/20Newsgroups/

I used the 20news-bydate-test dataset to transform and clean the text documents using R.
* Read all 7532 texts documents from 20 topic folders into one dataframe 
* Remove new lines, tabs, & carriage returns 
* Transform to necessary format (topic, post_no, text) 
* Write dataframe to csv
