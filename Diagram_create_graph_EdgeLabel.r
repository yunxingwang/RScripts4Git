library(readxl)
library(DiagrammeR)
library(dplyr)
library(magrittr)
library(jsonlite)
#library(shiny)
#library(shinyAce)
GS="OMX_1_"

NS0<-read_excel("NASDAQ_OMX.xls",sheet = "Nodes")
ES0<-read_excel("NASDAQ_OMX.xls",sheet = "Edges")
NS1<-filter(NS0,grepl(GS,NS0$NV))
ES1<-filter(ES0,grepl(GS,ES0$Begin))
ES1 <-  ES1 %>% mutate(Label=replace(Label, is.na(Label), ''))
#FullEN<-FullEN%>%mutate(NV=replace(NV,!is.na(NV),End))

#FullNE <-  ES1 %>% mutate(BeginNode=replace(ES1$Begin,ES1$Begin %in% NS1$NV , NS1$Node))
#FullNE <-  ES1 %>% mutate(BeginNode=replace(ES1$Begin,filter(NS1,ES1$Begin==NS1$NV) , NS1$Node))

nodes <-
  create_nodes(
    nodes = NS1$NV,
    #type = "letter",
    #style= "filled",
    label = NS1$Node,
    shape=NS1$Shape)
edges <-
  create_edges(
    from = ES1$Begin,
    to = ES1$End,
    #rel = "leading_to",
    label=ES1$Label
    )
edges
nodes
graph_attrs_d <- c("layout = neato",
                 "overlap = false",
                 "fixedsize = false",
                 "ranksep = 3",
                 "rankdir = TB",
                 "outputorder = edgesfirst")
graph <-
  create_graph(
    nodes_df = nodes,
    edges_df = edges,
    graph_attrs = graph_attrs_d,
    node_attrs = "fontname = Helvetica",
    node_attrs = "fixedsize =false",
    edge_attrs = "color = gray20"
    )
render_graph(graph,width = 1200, height = 800)
render_graph(graph,output="vivagraph")
render_graph(graph,output = "visNetwork")



FullEN<-left_join(ES1,NS1,by=c("Begin"="NV"))
FullEN<-left_join(FullEN,NS1,by=c("End"="NV"))
FullEN<-select(FullEN,Begin,End,Label,From=Node.x,FromShape=Shape.x,To=Node.y,ToShape=Shape.y)

ExceptionNodes<-filter(FullEN,ToShape=="Msquare")
WarningNodes<-filter(FullEN,ToShape=="Mcircle")

MP<-get_paths(graph,from ="OMX_1_1" )

#########################################
# this is for all graphs


#for (i in 1:length(MP))
GSeries <-create_series()

for (i in 1:1)
 {
  G<-paste0("G_",i)
  MyDF<-as.data.frame(MP[[i]])
  colnames(MyDF)[i]<-"Nodes"
  DynamicNS<-left_join(MyDF,NS1,by=c("Nodes"="NV"))
  
  DynamicNodes <-
    create_nodes(
      nodes = DynamicNS$Nodes,
      type = "letter",
      style= "filled",
      label = DynamicNS$Node,
      shape=DynamicNS$Shape)
   TNS<-NULL
   TNE<-NULL
   TNF<-NULL
   for (j in 1:(length(MP[[i]])-1))
   {
     TNS<-c(TNS,MP[[i]][[j]])
     TNE<-c(TNE,MP[[i]][[j+1]])
     TNF<-c(TNF,MP[[i]][[j]])
     if (j==length(MP[[i]])-1)
     {
       TNF<-c(TNF,MP[[i]][[j+1]])
     }
    }
   TempNS<-data.frame(Begin=TNS,End=TNE)
   #filter(FullEN,Begin %in% TN |  End %in% TN )
   print(TempNS)   
   #TempES
   #TempGraph
   DynamicES<-left_join(TempNS,FullEN)
   DynamicEdges <-
     create_edges(
       from = DynamicES$Begin,
       to = DynamicES$End,
       #rel = "leading_to",
       label=DynamicES$Label
     )
   
   DynamicGraph <-
     create_graph(
       nodes_df = DynamicNodes,
       edges_df = DynamicEdges,
       graph_attrs = "rankdir = TB",
       graph_attrs = "layout = neato",
       graph_attrs = "overlap = false",
       node_attrs = "fontname = Helvetica",
       node_attrs = "x=0",
       node_attrs = "y=100",
       edge_attrs = "color = gray20"
     )
   
   render_graph(DynamicGraph)
   GSeries<-add_to_series(G)
 }

#print(MP[[12]])










#print(graph$nodes_df$nodes)

#######################################################################
# grapht <-  create_graph()
# 
# grapht <-
#   grapht %>%
#   add_n_nodes()
# 
#   add_edges_w_string(  )
#   
#   renderDiagrammeR(graph %>% graph )
#   
#   renderGrViz()
#   graph %>%
#     get_selection
#   graph %>%
#     #select_nodes_by_id("OMX_1_1") %>%
#     select_edges_by_node_id("OMX_1_3") %>%
#     #select_edges_by_node_id(4) %>%
#     trav_both %>%
#     get_selection
#   #graph
#   
# edges