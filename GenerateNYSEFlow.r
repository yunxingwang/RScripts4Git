library(readxl)
library(DiagrammeR)
library(dplyr)
PageV<-"P62"
EdgeV<-paste0(PageV,"_Edges")

DS1<-read_excel("Diagram_in_Excel.xls",sheet = PageV)
ES1<-read_excel("Diagram_in_Excel.xls",sheet = EdgeV)

ShapeList<-unique(DS1$Shape)
NodeList<-unique(DS1$Node)

UniqueShapeList<-unique(ShapeList)
print(UniqueShapeList)
print(length(UniqueShapeList))
print(NodeList)
ShapeSpec<-""
for (i in 1:length(UniqueShapeList))
{
  #print(UniqueShapeList[i])
  T<-filter(DS1, Shape == UniqueShapeList[i])
  if (UniqueShapeList[i] == 'tab')
  {
    ProcessorColor=' fillcolor=blue,'
  }
  else
  {
    ProcessorColor='fillcolor=\"\",'
  }
  
  NodeSpec<-paste0("node [shape =",  UniqueShapeList[i], ",",ProcessorColor ," fontsize = 60, style = filled , label=\"\"] \n ")
  NodeStr<-""
    for (j in 1:length(T$Node))
    {
      NodeStr<-paste0(NodeStr,T$NV[j]," [label=\"", T$Node[j] , "\"] \n")
    }
  NodeSpec<-paste0(NodeSpec,NodeStr)
  ShapeSpec<-paste0(ShapeSpec,NodeSpec)
  print(NodeSpec)

}
Head0<- paste0("digraph ", PageV," { \n","graph [layout=dot, compound = true, splines=ortho, fontsize = 30, nodesep = .5, ranksep = .25, overlap=scalexy, rankdir=TB] \n")

EdgePool<-"edge [color=green,fontsize=50, style=bold ] \n"
print(nrow(ES1))
for (i in 1:nrow(ES1))
{
  if (is.na(ES1$Label[i])==TRUE)
  {
    EdgeT<-paste0(ES1$Begin[i],"->",ES1$End[i],"[label=\"\"] \n")  
  }
  else
  {
    EdgeT<-paste0(ES1$Begin[i],"->",ES1$End[i],"[label=",ES1$Label[i],"] \n")  
  }
  
  EdgePool<-paste0(EdgePool,EdgeT)
}
print(EdgePool)
if (PageV=="P62")
{
  RankInfo<-"{rank=same;P62_2;P62_3;P62_8;} \n {rank=same;P62_10;P62_6;P62_5;}\n"  
}
else
{
  RankInfo<-"\n"
}

ShapeSpec<-paste(Head0,ShapeSpec,EdgePool,RankInfo,"}")
print(ShapeSpec)
filename<-paste0("NYSE_",PageV,".gv")
write(ShapeSpec,file=filename)
grViz(ShapeSpec)