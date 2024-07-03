# purpose: this is a string that will help you identify characters that might not fit your encoding
# notes: this isn't exhaustive but is a good start!

data %>%
  mutate(spec_char = str_detect(val, regex("[^A-Za-z0-9\\s\\.\\,\\%\\?\\/\\-\\'\\(\\)\\&\\;\\:\\#\\*\\_\\\\\\#\\•\\~Ñó]"))) %>%
  filter(spec_char == T)

# if you need to recode everything quickly, you can do this
Encoding(data$val) <- "latin1"
