# purpose: access Outlook messages and attachments from R
# notes: 
## this uses the RDCOMClient package to connect to Outlook
## this script will only access messages stored on your local machine (it doesn't work on messages stored on the cloud)
## you have to have Outlook open on the machine you're using for this to work 

library(RDCOMClient)

# basic connection -----------------------------
## connect to outlook ----
outlook_app <- COMCreate("Outlook.Application")

## check on multiple inboxes ----
out_stores <- outlook_app$Session()$Stores()
out_stores$Count()

## list the names of the inboxes ----
for (i in 1:out_stores$Count()) {
  
  store <- out_stores[[i]]$GetRootFolder()$Name()
  print(store)
  
}

## make sure the folder you want is in the mailbox ----
folder_name <- "Inbox" 
folder <- out_stores[[3]]$GetRootFolder()$folders(folder_name) # the number is the 'store' or mailbox number
folder$Name()

# go through the emails ----------------------
## get the number of items in the folder ----
folder$Items()$Count()

## get the emails to loop through ----
emails <- folder$Items

## print subjects for the first 10 emails ----
for (i in 1:10) {
  
  print(emails(i)$Subject())
  
}

## get other information from the emails ----
for (i in 1:10) { 
  
  # get the subjects
  subject <- emails(i)$Subject(1)
  print(subject) 
  
  # get the received date
  print(emails(i)$Subject())
  file_date <- as.Date(emails(i)$ReceivedTime(), origin = "1899-12-30") - 1
  print(file_date)
  
  # look for attachments
  attachments_obj <- emails(i)$Attachments()
  
  if(attachments_obj$Count() > 0){ # Check if there are attachments
    
    for(i in c(1:attachments_obj$Count())){ # Loop through attachments
      
      # print attachment names 
      print(attachments_obj$Item(i)$DisplayName()) 
      
      # save attachments 
      ## set up the path, file_name and file path to save the attachment:
      #      path <- ""
      #      file_name <- attachments_obj$Item(i)$DisplayName()
      #      attach_file <- paste0(path, "_", file_name, "received_", file_date, ".pdf")
      
      ## actually save the file 
      #      attachments_obj$Item(i)$SaveAsFile(attach_file)
      
    }
  }
}
