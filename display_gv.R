library(DiagrammeR)

grViz("
      digraph
      DAG {
      
      graph [overlap = true]
      
      # Initialization of node attributes
      node [shape = box,fontname = Helvetica, color = blue, type = box]
      
      # Initialization of edge attributes
      edge [color = green,rel = yields]
      
      # Node statements
      'My Name'; 
      'Raise Exception CUSIP has changed \r\n when potential exchange change happens';  
      3; 4; 8; 9; 10; 11
      
      # Revision to node attributes
      node [shape = circle]
      
      # Node statements
      5; 6; 7
      
      # Edge statements
      'My Name'->5; 
      'Raise Exception CUSIP has changed \r\n when potential exchange change happens'->6; 
      3->9; 4->7; 5->8; 5->10; 7->11
      
      # Revision to edge attributes
      edge [color = red]
      
      # Edge statements
      'My Name'->8; 3->6; 3->11; 3->7; 5->9; 6->10
      }
      ")
grViz(diagram="ER.gv")
grViz(diagram="test.gv")


graphml_graph <-import_graph("2.graphml")
render_graph(graphml_graph)


