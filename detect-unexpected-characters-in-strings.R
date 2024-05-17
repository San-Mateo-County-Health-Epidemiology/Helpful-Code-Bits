# purpose: this is a string that will help you identify characters that might not fit your encoding
# notes: this isn't exhaustive but is a good start!

data %>%
  mutate(spec_char = str_detect(val, regex("[^A-Za-z0-9\\s\\.\\,\\%\\?\\/\\-\\'\\(\\)\\&\\;\\:\\#\\*\\_\\\\\\#]"))) %>%
  filter(spec_char == T)