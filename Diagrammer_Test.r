library(DiagrammeR)

DiagrammeR("
           sequenceDiagram;
           customer->>ticket seller: ask ticket;
           ticket seller->>database: seats;
           alt tickets available
           database->>ticket seller: ok;
           ticket seller->>customer: confirm;
           customer->>ticket seller: ok;
           ticket seller->>database: book a seat;
           ticket seller->>printer: print ticket;
           else sold out
           database->>ticket seller: none left;
           ticket seller->>customer:  sorry;
           end
           ")

## End(Not run)

DiagrammeR("
  graph LR
    A-->B
    A-->C
    C-->E
    B-->D
    C-->D
    D-->F
    E-->F
")

DiagrammeR("
   graph TB
           A-->B
           A-->C
           C-->E
           B-->D
           C-->D
           D-->F
           E-->F
           ")


DiagrammeR("graph LR;
           A(Rounded)-->B[Squared];
           B-->C{Yes or No};
           C-->D[Square One];
           C-->E[Square Two];
           style A fill:#E5E25F;
           style B fill:#87AB51;
           style C fill:#3C8937;
           style D fill:#23772C;
           style E fill:#B6E6E6;
           ")

# Load in the 'mtcars' dataset
data(mtcars)
connections <- sapply(
  1:ncol(mtcars)
  ,function(i){
    paste0(
      i
      ,"(",colnames(mtcars)[i],")---"
      ,i,"-stats("
      ,paste0(
        names(summary(mtcars[,i]))
        ,": "
        ,unname(summary(mtcars[,i]))
        ,collapse="<br/>"
      )
      ,")"
    )
  }
)


DiagrammeR(
  paste0(
    "graph TD;", "\n",
    paste(connections, collapse = "\n"),"\n",
    "classDef column fill:#0001CC, stroke:#0D3FF3, stroke-width:1px;" ,"\n",
    "class ", paste0(1:length(connections), collapse = ","), " column;"
  )
)


library(htmltools)
diagramSpec = "
graph LR;
id1(Start)-->id2(Stop);
style id1 fill:#f9f,stroke:#333,stroke-width:4px;
style id2 fill:#ccf,stroke:#f66,stroke-width:2px,stroke-dasharray: 5, 5;
"
html_print(tagList(
  tags$h1("R + mermaid.js = Something Special")
  ,tags$pre(diagramSpec)
  ,tags$div(class="mermaid",diagramSpec)
  ,DiagrammeR()
)
)



nodes <-
  create_nodes(
    nodes = c("a", "b", "c", "d"))

# 2. create the graph object with `create_graph()`
#    and pass in the ndf to `nodes_df`
graph <- create_graph(nodes_df = nodes)

# You can create a similar graph with just nodes but
# also provide a range of attributes for the nodes
# (e.g., types, labels, arbitrary 'values')
nodes <-
  create_nodes(
    nodes = c("a", "b", "c", "d"),
    label = TRUE,
    type = c("type_1", "type_1",
             "type_5", "type_2"),
    shape = c("circle", "circle",
              "rectangle", "rectangle"),
    values = c(3.5, 2.6, 9.4, 2.7))

graph <- create_graph(nodes_df = nodes)




library(DiagrammeR)

graph1<-
DiagrammeR("
           graph TD;
           A[rect]-- add style -->A2{\'rect\' + <br/> style};
           B{rhombus}-->|+ some style|B2{rhombus + style};
           C(rounded);   D((circle)); 
           style A2 fill:#c12,stroke-width:5px;
           style B2 fill:none, stroke-dasharray:10;
           ")
graph_info(graph1)

library(DiagrammeR)
#DiagrammeR("graph LR;
#          Moving-In Exchange Change[rect]-->Can corresponding ExchangeChange[rect] ;
#           ")
MGraph<-mermaid("graph LR;A[Moving-In Exchange Change]-->|Y|B[Can corresponding ExchangeChange];")

