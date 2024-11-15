# **** NOTE: This is now in the smcepi R package in the smc_city_clean() function ***

# code to clean cities
## how to use: input a dataset that has a column called "city". "city" should be a string column with names of cities in it
## recommendation: from your dataset you want to clean, create a new dataset with just an ID and the city column. Pass that dataset through this fucntion and then join it back to your original dataset. 
## note: this ONLY cleans SMC cities. Do not add non-SMC cities (or places that are not cities in SMC) to this function

library(tidyverse)
library(stringr)

city_clean <- function(data) {
  data1 <- data %>%
    rename(city_orig = city) %>%
    mutate(city = str_replace_all(str_to_lower(city_orig), "\\.|\\-|\\,|\\s", ""),
           city_clean = case_when(str_detect(city, regex("^arther|^ather")) ~ "Atherton",
                                str_detect(city, regex("^belmo|^bellmo|^bemon|blemon")) | city %in% c("bely") ~ "Belmont",
                                str_detect(city, regex("^brisba")) ~ "Brisbane",
                                str_detect(city, regex("^broadmoor")) ~ "Broadmoor",
                                str_detect(city, regex("^burl+in|^burlig|^buling|^buring|^brling|^buriling")) ~ "Burlingame",
                                str_detect(city, regex("^colm|^coma|^colom")) ~ "Colma",
                                str_detect(city, regex("^da.*ity$|^dail|^dlay|^daly.*y$")) ~ "Daly City",
                                str_detect(city, regex("^eap|^epalo|^e.*alto$|^eastpa|paloaltoeast")) ~ "East Palo Alto",
                                str_detect(city, regex("^elgr[ae]n.*da|^elgan.*da")) ~ "El Granada",
                                str_detect(city, regex("^emerald.*ills$")) ~ "Emerald Hills",
                                str_detect(city, regex("^fost|^forst|^fist")) ~ "Foster City",
                                str_detect(city, regex("^halfmo|hmb|^halmo|^hallfmo|^malfmo|^ha.*oonbay$")) ~ "Half Moon Bay",
                                str_detect(city, regex("^hillsbo|^hillbo|^hilsbo|^hissbo|^hiilsbo|^hi.*borough$")) ~ "Hillsborough",
                                str_detect(city, regex("^lahond")) ~ "La Honda",
                                str_detect(city, regex("^ladera")) ~ "Ladera",
                                str_detect(city, regex("^lomam")) ~ "Loma Mar",
                                str_detect(city, regex("^menl|^me[nl]o|menlopark|^men.*park$")) ~ "Menlo Park",
                                str_detect(city, regex("^millb|^milb|^milli|billbrae")) ~ "Millbrae",
                                str_detect(city, regex("^mont[ea]ra")) ~ "Montara",
                                str_detect(city, regex("^mossb|^missb")) ~ "Moss Beach",
                                str_detect(city, regex("^paci.*a$|^pacific$")) ~ "Pacifica",
                                str_detect(city, regex("^pescad|^p.*adero$")) ~ "Pescadero",
                                str_detect(city, regex("^portola|^port.*y$|^port.*lye$")) ~ "Portola Valley",
                                str_detect(city, regex("^princet")) ~ "Princeton-by-the-Sea",
                                str_detect(city, regex("^redwo.*ty$|^red.*city$|^r.*oodcity$|^redwoo|^rwc$|^red wood|^rewoo|redwood$")) ~ "Redwood City",
                                str_detect(city, regex("^sanb[rut]|^s.*bruno$")) ~ "San Bruno",
                                str_detect(city, regex("^sanca")) ~ "San Carlos",
                                str_detect(city, regex("^sangreg")) ~ "San Gregorio",
                                str_detect(city, regex("^sanma[teogry]e|^sm$|^sammat|^s[an].*teo$|^sanmat.*o$|mateo|hillsdale")) ~ "San Mateo",
                                str_detect(city, regex("^s{2,}anfra|^southsanfra|^sosanfra|^ssf$|^sosf$|^southsf$|^sou.*ity$|^s[ou].*isco$")) ~ "South San Francisco",
                                str_detect(city, regex("wood.*de$")) ~ "Woodside",
                                str_detect(city, regex("homeless|unshelt")) ~ "Unsheltered"))
  data1
    
}
