library(rCharts) 
meanvars=read.csv("~/Desktop/temp.txt") 
# These are data regarding means of clusters of NCAA athletic department expenses at public universities. Please see the blog post where these charts were originally used # regarding more details on the origins of these data.: http://analyticsandvisualization.blogspot.com/2013/10/subsidies-revenues-and-expenses-of-ncaa.html 
meanvars=meanvars[,-1] # Removing the first column --- csv quirk 
parrSchool <- rCharts$new() 
parrSchool$field('lib', 'parcoords') 
parrSchool$set(padding = list(top = 25, left = 5, bottom = 10, right = 0), width=800, height=400) 
parrSchool$set(data = toJSONArray(meanvars, json = F), 
               colorby = 'Total.Revenue', 
               range = range(meanvars$Total.Revenue), 
               colors = c('red','blue') 
) 
parrSchool$setLib("parcoords") # This is tricky... this folder should be in your current working directory. Contents can be downloaded from https://github.com/patilv/ncaagginteractive/tree/master/parcoords 
parrSchool

