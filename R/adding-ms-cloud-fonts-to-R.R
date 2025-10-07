##################################################
#
# enable cloud fonts in R 
# this walks through doing that with Trade Gothic Next Rounded, but will work with other cloud fonts
#
##################################################

rm(list = ls())

library(extrafont) # for loading fonts
library(ggplot2) # for testing fonts 

# before running the code ------------------------
## 1. Open C:/Windows/Fonts and check if Trade Gothic Next Rounded is there (it likely is not). If it is, skip to the code. Otherwise go to step 2
## 2. Open C:/Users/<username>/AppData/Local/Microsoft/FontCache/4/CloudFonts and find Trade Gothic Next Rounded. You probably need to type this path in as AppData and the other folders don't typically show up as icons
## 3. Open the Trade Gothic Next Rounded folder. 
## - If the Trade Gothic Next Rounded folder is not there, open a Microsoft application and access Trade Gothic Next Rounded in that application. Then go back and you should see the folder.
## 4. In the folder there should be at least one .ttf file. Open the file(s) until you find the one for Trade Gothic Next Rounded (not bold or italic). Manually rename that .ttf file to "TradeGothicNextRounded" (this is the string you'll search for in the `font_import(pattern = "")`).
## 5. Open the file you renamed and click "install" in the upper left corner.
## 6. Go back to C:/Windows/Fonts and verify Trade Gothic Next Rounded is there

# import TradeGothic so it is available in R -----
font_import(pattern = "TradeGothicNextRounded")

# check that it worked! --------------------------
### load the fonts ----
extrafont::loadfonts(quiet = T, device = "win")

### make sure it's in the list (it should be at the end) ----
names(grDevices::windowsFonts())

## test with ggplot ----
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(title = "Testing Trade Gothic") +
  theme(plot.title = element_text(family = "Trade Gothic Next Rounded", face = "bold", size = 24, hjust = 0))
