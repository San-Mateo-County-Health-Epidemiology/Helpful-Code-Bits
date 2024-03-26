# purpose: get the username of the person in the current session
# notes: this is useful when dynamically creating usernames in a script, ex: paste0(Sys.getenv("USERNAME"), "@domain.gov") would create email addresses for a given organization

Sys.getenv("USERNAME")