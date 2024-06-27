snippet # AUTHOR:   M. Mashamba | USAID
# PURPOSE:  Create a hyperfile for refreshing quarterly dashboard
# REF ID:   95055e45 
# LICENSE:  MIT
# DATE:     2024-06-27
# UPDATED: 

# DEPENDENCIES ------------------------------------------------------------
  
  library(glamr)
  library(tidyverse)
  library(glitr)
  library(gophr)
  library(extrafont)
  library(scales)
  library(tidytext)
  library(patchwork)
  library(ggtext)
  library(glue)
  library(readxl)
  library(googlesheets4)
  


# IMPORT ------------------------------------------------------------------
genie_files<-list.files("Data",pattern="FY", full.names = TRUE) #list genie files in the folder

genie<-genie_files %>% 
  map(read_psd) %>% 
  reduce(rbind) #appending the genie files

?reshape_msd 

df_test <- genie %>% 
  reshape_msd("long", include_type = TRUE) #pivot cumulative, result and target to long and adding period and period type

df_test2 <- df_test %>% 
  mutate(`short name`= psnu) %>% 
  
  

# MUNGE -------------------------------------------------------------------
