# purpose: save a password in a computer to be fetched later
# notes: if you want to run a script that requires a password, you can save it with keyring. You just run this code on the computer where you need the password. Then you can run the script and it fetches the password

library(keyring)

# set the inputs ----
key_set_with_value(service = "essence", # this is how you reference the username/pwd pair later
                   username = "username", # put your username here
                   password = "password") # put your password here 


# fetch the inputs ----
## username ----
key_list("essence")[1,2]

## password ----
key_get("essence", 
        key_list("essence")[1,2])