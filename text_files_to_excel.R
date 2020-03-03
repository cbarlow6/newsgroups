library(foreach)
library(stringr)
library(readr)
library(tibble)
library(readxl)

# write text files to excel

#selected text folders to be read
category <- c("alt.atheism", "comp.graphics", "comp.os.ms-windows.misc",
              "comp.sys.ibm.pc.hardware", "comp.sys.mac.hardware",
              "comp.windows.x", "misc.forsale", "rec.autos", "rec.motorcycles",
              "rec.sport.baseball", "rec.sport.hockey", "sci.crypt",
              "sci.electronics", "sci.med", "sci.space", "soc.religion.christian",
              "talk.politics.guns", "talk.politics.mideast", "talk.politics.misc",
              "talk.religion.misc")


# create one excel file containing all texts
#read file names in each folder
df <- foreach(j = 1:length(category), .combine = rbind) %do% {
  folder <- category[j]
  f_names <- list.files(folder, recursive = T)
  file_path <- str_c(folder, "/", f_names)

  #read text file, remove new line, tab, & carriage returns, and 
  #transform to needed format (topic, post_no, text) 
  
  foreach(i = 1:length(f_names), .combine = rbind) %do% 
    {file <- read_file(file_path[i])
    topic <- category[j]
    post_no <- f_names[i]
    #author <- str_extract(file, "\\QFrom:\\E.+\\S")
    #title <- str_extract(file, "\\QSubject:\\E.+\\S")
    text <- str_replace_all(file, "\\n|\\t|\\r", " ")
    tibble(Topic = topic, Post_no = post_no, Text = text)
    }
  
}

write_excel_csv(df, path = "new_newsgroup_texts7532.csv", 
                append = FALSE, col_names = TRUE)

