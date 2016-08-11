library(DiagrammeR)
library(magrittr)

graph <-
  create_graph() %>%
  set_graph_name("software_projects") %>%
  set_global_graph_attrs(
    "graph", "output", "visNetwork") %>%
  add_nodes_from_table(
    system.file(
      "examples/contributors.csv",
      package = "DiagrammeR"),
    set_type = "person",
    label_col = "name") %>%
  add_nodes_from_table(
    system.file(
      "examples/projects.csv",
      package = "DiagrammeR"),
    set_type = "project",
    label_col = "project") %>%
  add_edges_from_table(
    system.file(
      "examples/projects_and_contributors.csv",
      package = "DiagrammeR"),
    from_col = "contributor_name",
    from_mapping = "name",
    to_col = "project_name",
    to_mapping = "project",
    rel_col = "contributor_role")

library(diagram)

M  <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)
C <- M
A <- M
M[2, 1] <- "Yes" 
M[4, 1] <- "No" 
M[2, 3] <- "Yes" 
M[4, 3] <- "No"
C[4, 1] <- -0.1
C[2, 3] <- 0.1
A[2, 1] <- A[2, 3] <- A[4, 3] <-4
A[4, 1] <-  8

col   <- M
col[] <- "red"
col[2, 1] <- col[4, 1] <- "blue"
plotmat(M, pos = c(2, 2), curve = C, name = c('My First Box','My 2 Box','My 3 Box','My 4 Box'),
        box.size=c(0.1,0.1,0.1,0.1), box.prop = 2,
        arr.lwd=A,
        lwd = 1, box.lwd = 2, box.cex = 1, cex.txt = 0.8, 
        arr.lcol = col, arr.col = col, box.type = c("rect","diamond","diamond","diamond"),
        lend=3)


nodes <-
  create_nodes(nodes = LETTERS,
               type = "letter",
               shape = sample(c("circle", "rectangle"),
                              length(LETTERS),
                              replace = TRUE),
               fillcolor = sample(c("aqua", "gray80",
                                    "pink", "lightgreen",
                                    "azure", "yellow"),
                                  length(LETTERS),
                                  replace = TRUE))

edges <-
  create_edges(from = sample(LETTERS, replace = TRUE),
               to = sample(LETTERS, replace = TRUE),
               rel = "letter_to_letter")

graph <-
  create_graph(nodes_df = nodes,
               edges_df = edges,
               graph_attrs = "layout = neato",
               node_attrs = c("fontname = Helvetica",
                              "style = filled"),
               edge_attrs = c("color = gray20",
                              "arrowsize = 0.5"))

vivagraph(graph = graph)


grViz("
digraph boxes_and_circles {
      
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica]
      A; B; C; D; E; F
      
      node [shape = circle,
      fixedsize = true,
      width = 0.9] // sets as circles
      1; 2; 3; 4; 5; 6; 7; 8
      
      # several 'edge' statements
      A->1 B->2 B->3 B->4 C->A
      1->D E->A 2->4 1->5 1->F
      E->6 4->6 5->7 6->7 3->8
      }
      ")