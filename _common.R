library(reactable)
library(ggplot2)

knitr::opts_chunk$set(message = FALSE,
                      dev.args = list(bg="transparent"))

# Make the fonts the same as the book
# Also consider making a couple different themes for different types of plots
theme_set(theme_minimal(20) +
            theme(plot.title.position = "plot",
                  legend.position = "bottom"))

update_geom_defaults('path', list(size = 1.5,
                                  color = "#7EC1E7"))
update_geom_defaults('smooth', list(size = 1.5, 
                                    color = "#7EC1E7",
                                    fill = "#C7E4F5"))
update_geom_defaults('point', list(size = 3, color = "#B3E5D9"))
update_geom_defaults('col', list(size = 3, fill = "#B3E5D9"))

scale_colour_discrete <- function(...) {
 colorspace::scale_color_discrete_qualitative(palette = "cold", ...)
}

scale_fill_discrete <- function(...) {
  colorspace::scale_fill_discrete_qualitative(palette = "cold", ...)
}

options(
  # ggplot options
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis",
  
  # reactable options
  reactable.theme = reactableTheme(
  backgroundColor = "transparent",
  borderColor = "#C7E4F5",
  highlightColor = "#7EC1E7",
  inputStyle = list(backgroundColor = "transparent"),
  selectStyle = list(backgroundColor = "transparent"),
  pageButtonHoverStyle = list(backgroundColor = "#B3E5D9"),
  pageButtonActiveStyle = list(backgroundColor = "#B3E5D9")
))
