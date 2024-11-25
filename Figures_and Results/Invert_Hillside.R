
library(ggplot2)


#Grouped bar plot for Hillside Invertebrates 
ggplot(data=InvertHillData, aes(x=Taxa.Order, y=Abundance, fill=Slope)) +
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

#Slope A 
Slope_A <- 
  data.frame(
  Species = c("Hemiptera", "Diptera", "Hymenoptera", "Ixodida", "Araneae", "Dermaptera"),
  Abundance = c(13, 7, 54, 20, 4, 1)  
) #values extracted from the InvertHillData data frame 

 
total_abundance <- sum(Slope_A$Abundance) #Calculates total abundance of species 
#(in this case order) in Slope A


Slope_A$Proportion <- Slope_A$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Slope_A$H_component <- Slope_A$Proportion * log(Slope_A$Proportion)  # pi * ln(pi), 
#proportion * natural log of the proportion 

H <- -sum(Slope_A$H_component, na.rm = TRUE)  # Sums each negative component and 
#then makes the output positive 

H # Slope A Index value 

#######################################################################################

#Slope B
Slope_B <- data.frame(
  Species = c("Ixodida", "Araneae", "Diptera", "Hemiptera", "Hymenoptera", "Lepidoptera", "Siphonaptera", "Trombidiformes", "Opiliones"),
  Abundance = c(78, 49, 18, 40, 3, 5, 3, 1, 1)  
) #values extracted from the InvertHillData data frame 


total_abundance <- sum(Slope_B$Abundance) #Calculates total abundance of species 
#(in this case order) in Slope B


Slope_B$Proportion <- Slope_B$Abundance / total_abundance #Calculates the proportion 
#of individuals in each species (in this case order)

# Calculate Shannon-Weiner Index (H')
Slope_B$H_component <- Slope_B$Proportion * log(Slope_B$Proportion) # pi * ln(pi), 
#proportion * natural log of the proportion 

HB <- -sum(Slope_B$H_component, na.rm = TRUE) # Sums each negative component and 
#then makes the output positive 

HB #Slope B Index Value 

