library(reactable)
library(ggplot2)

knitr::opts_chunk$set(message = FALSE,
                      dev.args = list(bg="transparent"))

# Make the fonts the same as the book
# Also consider making a couple different themes for different types of plots
theme_set(theme_minimal(15) +
            theme(plot.title.position = "plot"))

options(reactable.theme = reactableTheme(
  backgroundColor = "transparent",
  borderColor = "#C7E4F5",
  highlightColor = "#7EC1E7",
  inputStyle = list(backgroundColor = "transparent"),
  selectStyle = list(backgroundColor = "transparent"),
  pageButtonHoverStyle = list(backgroundColor = "#B3E5D9"),
  pageButtonActiveStyle = list(backgroundColor = "#B3E5D9")
))
