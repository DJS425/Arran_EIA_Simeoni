
library(ggplot2)


#Grouped bar plot for Moth Hillside Invertebrates 
ggplot(data=MothData, aes(x=Taxa.Order, y=Abundance, fill=Slope)) +
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

#Shannon-Weiner Diversity Index Calculations for Invertebrates in Slope A and B

#Slope A for the moth traps
Slope_A <- 
  data.frame(
    Species = c("Hemiptera", "Lepidoptera", "Diptera", "Trichoptera", "Araneae"),
    Abundance = c(5,16,8,1,1)  
  ) #values extracted from the MothData data frame 


total_abundance <- sum(Slope_A$Abundance) #Calculates total abundance of species 
#(in this case order) in Slope A


Slope_A$Proportion <- Slope_A$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Slope_A$H_component <- Slope_A$Proportion * log(Slope_A$Proportion)  # pi * ln(pi), 
#proportion * natural log of the proportion 

HAM <- -sum(Slope_A$H_component, na.rm = TRUE)  # Sums each negative component and 
#then makes the output positive 

HAM # Slope A Index value 

#######################################################################################

#Slope B for the moth traps
Slope_B <- data.frame(
  Species = c("Lepidoptera", "Diptera", "Hymenoptera"),
  Abundance = c(4,3,1)  
) #values extracted from the MothData data frame 


total_abundance <- sum(Slope_B$Abundance) #Calculates total abundance of species 
#(in this case order) in Slope B


Slope_B$Proportion <- Slope_B$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Slope_B$H_component <- Slope_B$Proportion * log(Slope_B$Proportion) # pi * ln(pi), 
#proportion * natural log of the proportion 

HBM <- -sum(Slope_B$H_component, na.rm = TRUE) # Sums each negative component and 
#then makes the output positive 

HBM #Slope B Index Value 
