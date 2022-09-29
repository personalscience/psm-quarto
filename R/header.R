# header.R  : load everything required for general script processing

load("assets/psmObjects.rda")


knitr::opts_chunk$set(echo=FALSE, warning=FALSE, message=FALSE)

library(ggthemes)
theme_set( theme_light(base_family = "MarkPro"))
theme_set(theme_economist() +theme(axis.title.x=element_blank()))# + scale_colour_economist())


if(Sys.info()["sysname"]=="Darwin"){
  quartzFonts(Candara = quartzFont(rep("Candara",4)), MarkPro = quartzFont(rep("MarkPro",4)))
} else windowsFonts(Candara = windowsFont("Candara"), MarkPro = windowsFont("MarkPro"))


