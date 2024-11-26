library(ggplot2)


#Bar plot for Bog Invertebrates
BogData <- BogData[-c(5:15),] #The R spreadsheet added rows that shouldn't be there

ggplot(data=BogData, aes(x=Taxa.Order, y=Abundance)) +
  geom_bar(stat="identity", position = "dodge", col="black", fill="orange", width=0.5) +
  labs(x="Taxon (Order)", y="Abundance") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size=10),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=16),
        axis.title.y = element_text(size=16),
        legend.title = element_text(size=16),
        legend.text = element_text(size=16))

############################################################################################

#Shannon-Weiner Diversity Index Calculations for Invertebrates in Slope A and B

#Bog 
Bog <- 
  data.frame(
    Species = c("Araneae", "Hemiptera", "Odanata", "Diptera"),
    Abundance = c(7, 26, 1, 1)  
  ) #values extracted from the BogData data frame 


total_abundance <- sum(Bog$Abundance) #Calculates total abundance of species 
#(in this case order) in Slope A


Bog$Proportion <- Bog$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Bog$H_component <- Bog$Proportion * log(Bog$Proportion)  # pi * ln(pi), 
#proportion * natural log of the proportion 

HBog <- -sum(Bog$H_component, na.rm = TRUE)  # Sums each negative component and 
#then makes the output positive 

HBog # Slope A Index value 
