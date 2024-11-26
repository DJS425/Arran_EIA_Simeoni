

library(ggplot2)


#Grouped bar plot for Freshwater Stream Invertebrates 
StreamsData2 <- StreamsData[-c(14),] #The R spreadsheet added a row that shouldn't be there
View(StreamsData2)

ggplot(data=StreamsData2, aes(x=Taxa.Order, y=Abundance, fill=Stream)) +
  geom_bar(stat="identity", position = "dodge", col="black") +
  labs(x="Taxon (Order)", y="Abundance") +
  scale_fill_manual(values=c("lightblue", "orange")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size=10),
        axis.text.y = element_text(size=10),
        axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14),
        legend.title = element_text(size=14),
        legend.text = element_text(size=14))

############################################################################################

#Shannon-Weiner Diversity Index Calculations for Invertebrates in Stream A and B

#Stream A 
Stream_A <- 
  data.frame(
    Species = c("Plecoptera", "Trichoptera", "Ephemeroptera", "Coleoptera", "Lumbriculidae",
                 "Tricladida", "Hemiptera", "Stylommatophora", "Isopoda", "Diptera",
                "Odonata", "Megaloptera", "Ixodida"),
    Abundance = c(13,16,14,2,4,2,1,1,1,3,1,1,2)  
  ) #values extracted from the StreamData data frame 


total_abundance <- sum(Stream_A$Abundance) #Calculates total abundance of species 
#(in this case order) in Stream A


Stream_A$Proportion <- Stream_A$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Stream_A$H_component <- Stream_A$Proportion * log(Stream_A$Proportion)  # pi * ln(pi), 
#proportion * natural log of the proportion 

HAS <- -sum(Stream_A$H_component, na.rm = TRUE)  # Sums each negative component and 
#then makes the output positive 

HAS # Stream A Index value 

#######################################################################################

#Stream B
Stream_B<- 
  data.frame(
    Species = c("Ephemeroptera", "Trichoptera", "Plecoptera", "Trombidiformes", "Diptera",
                "Megaloptera", "Lumbriculidae", "Isopoda", "Coleoptera"),
    Abundance = c(13, 6, 12, 1, 5, 4, 1, 1, 1)  
  ) #values extracted from the StreamData data frame 


total_abundance <- sum(Stream_B$Abundance) #Calculates total abundance of species 
#(in this case order) in Stream A


Stream_B$Proportion <- Stream_B$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Stream_B$H_component <- Stream_B$Proportion * log(Stream_B$Proportion)  # pi * ln(pi), 
#proportion * natural log of the proportion 

HBS <- -sum(Stream_B$H_component, na.rm = TRUE)  # Sums each negative component and 
#then makes the output positive 

HBS # Stream A Index value 
