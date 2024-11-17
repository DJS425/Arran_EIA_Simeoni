
#Grouped bar plot for Hillside Invertebrates 


library(ggplot2)



ggplot(data=InvertHillData2, aes(x=Taxa.Order, y=Abundance, fill=Slope)) +
  geom_bar(stat="identity", position = "dodge", col="black") +
  labs(x="Species", y="Abundance") +
  scale_fill_manual(values=c("lightblue", "orange")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Example data
Slope_A <- data.frame(
  Species = c("Hemiptera", "Diptera", "Hymenoptera", "Ixodida", "Araneae", "Dermaptera"),
  Abundance = c(13, 7, 54, 20, 4, 1)  
)

# Calculate total abundance
total_abundance <- sum(Slope_A$Abundance)

# Calculate proportions (p_i)
Slope_A$Proportion <- Slope_A$Abundance / total_abundance

# Calculate Shannon-Weiner Index (H')
Slope_A$H_component <- Slope_A$Proportion * log(Slope_A$Proportion)  # p_i * ln(p_i)
H <- -sum(Slope_A$H_component, na.rm = TRUE)  # Negative sum of components
H


# Example data
Slope_B <- data.frame(
  Species = c("Ixodida", "Araneae", "Diptera", "Hemiptera", "Hymenoptera", "Lepidoptera", "Siphonaptera", "Trombidiformes", "Opiliones"),
  Abundance = c(78, 49, 18, 40, 3, 5, 3, 1, 1)  
)

# Calculate total abundance
total_abundance <- sum(Slope_B$Abundance)

# Calculate proportions (p_i)
Slope_B$Proportion <- Slope_B$Abundance / total_abundance

# Calculate Shannon-Weiner Index (H')
Slope_B$H_component <- Slope_B$Proportion * log(Slope_B$Proportion)  # p_i * ln(p_i)
HB <- -sum(Slope_B$H_component, na.rm = TRUE)  # Negative sum of components
HB

