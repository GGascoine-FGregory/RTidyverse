# Load the tidyverse package
library(tidyverse)

# Create a simple data frame
df <- data.frame(
  name = c("John", "Sara", "Mike", "Jessica"),
  age = c(23, 28, 31, 22),
  height = c(180, 165, 170, 175)
)

# Print the original data frame
print(df)

# Use dplyr to filter rows and select columns
df %>%
  filter(age > 25) %>%
  select(name, height) -> df_filtered

# Print the filtered data frame
print(df_filtered)

# Use ggplot2 to create a simple plot
ggplot(df, aes(x = age, y = height)) +
  geom_point() +
  geom_text(aes(label = name), vjust = -1)
            