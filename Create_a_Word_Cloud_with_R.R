# Create a Word Cloud with R 
# By Sherif Sakr, Cairo Egypt, 19 June 2022

# Get the Current Date and Time
Sys.time()

# Word Cloud
# Word cloud, tag cloud, wordle or weighted list in visual design tag cloud is a visual depiction
# of cloud text data with lots of words in different sizes, colors and positions which represent 
# the frequency or the important of each word and express the relationships.


# Install world cloud R package to plot a word cloud
install.packages("wordcloud")
library(wordcloud)

# Data set
# U.S. States ranked by population according to the World Population Review website
# Load data set

US_2022_pop <- read.csv("C:/Users/hp/Documents/Sherif_Project_7_11_2021/csvData.csv",
                        header = TRUE)


US_2022_pop

df <- as.data.frame(US_2022_pop[US_2022_pop$State,US_2022_pop$Pop])


# Sort U.S. States by Population
df <- US_2022_pop[order(US_2022_pop$Pop, decreasing = TRUE),]
df

# Assign colors red to blue, which red represents large population,
# and blue represents small population
myColors <- colorRampPalette(c("Red", "Blue"))

df$thisRowColor <- myColors(nrow(df))

#worldPopSubSet$thisRowColor <- myColors(nrow(worldPopSubSet))

# create the word cloud to depict the U.S. States ranked by Population
# Use par() function to to set or query  graphical parameters
# where mar determines the margin vector in which margins are in the order,
# where pty specifying the type of plot region to be used.
# where mtext set the margin text
par(mar = c(1,1,1,1), pty="m")
with(df,wordcloud(words=State,freq=Pop,colors = thisRowColor))
mtext("Word Cloud with R", side = 3)




