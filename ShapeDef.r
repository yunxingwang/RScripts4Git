library(readxl)
library(DiagrammeR)
library(dplyr)
PageV<-"ShapeDef"
SheetList<-excel_sheets("Diagram_in_Excel.xls")
SS1<-read_excel("Diagram_in_Excel.xls",sheet = PageV)
Head0<- paste0("digraph ", PageV," { \n","graph [layout=dot, compound = true, fontsize = 30, nodesep = .5, overlap=scalexy, rankdir=TB] \n")
NodeSpec<-""
NodeStr<-""
for (j in 1:length(SS1$Node))
{
  NodeStr<-paste0("node [shape =",  SS1$Shape[j]," fontsize = 60, style = filled , label=\"\"] \n ", SS1$NV[j]," [label=\"", SS1$Node[j] , "\"] \n")
  NodeSpec<-paste0(NodeSpec,NodeStr)
}
#print(NodeSpec)
ShapeSpec<-paste0(Head0,NodeSpec,"}")
grViz(ShapeSpec)
filename<-paste0("NYSE_",PageV,".gv")
write(ShapeSpec,file=filename)
