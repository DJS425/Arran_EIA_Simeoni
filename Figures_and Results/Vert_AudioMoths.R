library(ggplot2)


#Bar plot for Vertebrate Species Richness from the audiomoths 
#The data set is so small because I just counted how many species were found in the audiomoth data 
#manually from the main Arran field course data set

par(mfrow=c(1,2))
ggplot(data=AudioMothRichnessData, aes(x=Slope, y=Species.Present, fill=Slope)) +
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

ggplot(data=AudioMothFreqData, aes(x=Species, y=Call.Frequency, fill=Slope)) +
  geom_bar(stat="identity", position = "dodge", col="black") +
  labs(x="Species", y="Call Frequency") +
  scale_fill_manual(values=c("lightblue", "orange")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size=10),
        axis.text.y = element_text(size=10),
        axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14),
        legend.title = element_text(size=14),
        legend.text = element_text(size=14))

#No Shannon diversity index because we didn't get to collect how many individuals there were per species 
