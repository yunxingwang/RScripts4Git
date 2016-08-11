library(DiagrammeR)
library(magrittr)

graph <-
  create_graph() %>%
  set_graph_name("DAG") %>%
  set_global_graph_attrs("graph", "overlap", "true") %>%
  set_global_graph_attrs("graph", "fixedsize", "true") %>%
  set_global_graph_attrs("node", "color", "blue") %>%
  set_global_graph_attrs("node", "fontname", "Helvetica") %>%
  add_n_nodes(11) %>%
  select_nodes_by_id(c(1:4, 8:11)) %>% 
  set_node_attrs_ws("shape", "box") %>%
  clear_selection %>%
  select_nodes_by_id(5:7) %>% 
  set_node_attrs_ws("shape", "circle") %>%
  clear_selection %>%
  add_edges_w_string(
    "1->5 2->6 3->9 4->7 5->8 5->10 7->11", "green") %>%
  add_edges_w_string(
    "1->8 3->6 3->11 3->7 5->9 6->10", "red") %>%
  select_edges("rel", "green") %>%
  set_edge_attrs_ws("color", "green") %>%
  invert_selection %>%
  set_edge_attrs_ws("color", "red")

render_graph(graph)