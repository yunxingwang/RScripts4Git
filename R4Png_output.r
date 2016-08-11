# Install the development version of `DiagrammeRsvg`
#devtools::install_github('rich-iannone/DiagrammeRsvg')

# Load other necessary libraries
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(svglite)
library(rsvg)
#library(png)

# Create a random graph
graph <-
  create_random_graph(
    10, 14,
    directed = TRUE,
    fully_connected = TRUE,
    set_seed = 25)

# Create a PNG of this graph
render_graph(graph)
export_graph(graph,'graph.pdf')
export
#export_svg(grViz(graph$dot_code)) %>%
#  charToRaw %>% rsvg %>% png::writePNG('graph.png')