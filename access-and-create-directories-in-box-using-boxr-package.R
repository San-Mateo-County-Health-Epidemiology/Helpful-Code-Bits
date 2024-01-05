##################################################
# 
# Connect to Box via API
# Krista Neumann + Beth Jump
#
##################################################

rm(list =)

library(fs)
library(boxr)
library(readr)
library(tidyverse)
library(writexl)

# authentication ---------------------------------
## The authentication function box_auth_service() takes token_file as an argument. Its default is the value of the environment variable BOX_TOKEN_FILE. If that does not exist, the default becomes ~/.boxr-auth/token.json.
## When you receive JWT (token) file for your first service-app, save it to your local computer as  ~/.boxr-auth/token.json. 

## to authenticate to Box using this token, run this:
box_auth_service()

# accessing box ----------------------------------
## find the id of the directory where you want to work ----
box_setwd("156850613884")

## list the files and directories in that directory ----
box_ls()

# directory updates ------------------------------
## create a new directory ----
folder_name <- paste0("data_", str_replace_all(Sys.Date(), "-", ""))
box_dir_create(folder_name)

## get the id of the new directory ----
new_folder_id <- data.frame(box_ls()) %>%
  arrange(desc(modified_at)) %>%
  slice(1) %>%
  select(id) %>%
  unlist(.) %>%
  unname(.)

## open the new directory ----
box_setwd(new_folder_id)

## upload files to that directory ----
file_path <- ""
box_ul(file = file_path)

## check to see that the files uploaded ----
box_ls()