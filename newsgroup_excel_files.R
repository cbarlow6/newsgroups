install.packages("foreach")

library(readxl)
library(stringr)
library(foreach)
library(tibble)

folder <- "20news-bydate/20news-bydate-test/1excel_files"
files <- list.files(path = folder, full.names = TRUE)

files
#texts_df <- read_excel("20news-bydate-test/misc.forsale_texts.xlsx")

newsgroup_df <-foreach(i = 1:length(files), .combine = rbind) %do% 
  {value <- read_excel(files[i], col_names = TRUE, n_max = 100)
  row.names<-value[ ,1]
  #tibble(post = value$Post_no, text = value$Text)
  }


