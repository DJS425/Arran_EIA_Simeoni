library(ggplot2)


#Bar plot for Vertebrate Species Richness from the transects
VertTransectData2 <- VertTransectData[-c(3:34),] #The R spreadsheet added a row that shouldn't be there
View(VertTransectData2)
#The data set is so small because I just counted how many species were found with the transect and camera traps 
#manually from the main Arran field course data set

ggplot(data=VertTransectData2, aes(x=Slope, y=Species.Present, fill=Slope)) +
  geom_bar(stat="identity", position = "dodge", col="black", width=0.5) +
  labs(x="Slope", y="Number of Species present") +
  scale_fill_manual(values=c("lightblue", "orange")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size=10),
        axis.text.y = element_text(size=10),
        axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14),
        legend.title = element_text(size=14),
        legend.text = element_text(size=14))

#No Shannon diversity index because we didn't get to collect how many individuals there were per species 