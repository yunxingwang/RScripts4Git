library(readxl)
library(DiagrammeR)
library(dplyr)
#datasets <- system.file("Diagram_in_Excel.xls", package = "readxl")
#read_excel(datasets)
#DS63<-read_excel("Diagram_in_Excel.xls",sheet = "P63")
# DiagrammeR(
#   paste(
#     "graph TD;", "\n",
#     paste0("A[",DS63[1,2],"]","-->","B[",DS63[1,3],"];",sep=''),"\n",
#     paste0("C[",DS63[2,2],"]","-->","D[",DS63[2,3],"];",sep='')  
#   )
# )
#Start & Decision & Action & 


DS62<-read_excel("Diagram_in_Excel.xls",sheet = "P62")
TypeList<-unique(DS62$Type)
BeginNodeList<-DS62$Begin
EndNodeList<-DS62$End
print(BeginNodeList)
print(EndNodeList)
NodeList<-append(BeginNodeList,EndNodeList)
print(NodeList)
UniqueNodeList<-unique(NodeList)
print(UniqueNodeList)
for (i in 1:length(TypeList))
{
  print(TypeList[i])
  T<-filter(DS62, Type == TypeList[i])
  print(T)  
  for (j in 1:nrow(T))
  {
    print(T$Begin)
    print(T$End)
  }
}
TypeList
T<-filter(DS62, Type == "Action")
print(T)


#draw<- paste0("digraph ggg {","\n"),
for (i in 1:nrow(DS62))
{ 
  if (DS62$Type=="Start") {
    print(DS62$Type)
    #print(i)
    #print(DS62[i,1])
  }
  

  draw1<-paste0("B",i,DS62[i,2],'"-->"',DS62[i,3],sep='')  ;
  draw<-paste(draw,draw1);
  
  for (j in 2:ncol(DS62))
  {
    print( DS62[i,j])  
  }
}
# 
#write(draw,file='test.gv')  

draw<- paste0("digraph ggg {","\n","graph [layout=dot] \n")
draw1<-paste0("node [shape =box, style = filled , label=''] \n ","B [label=string]\n","C [label=text]\n","B->","C[label=\"test\"]","\n }",sep='')
draw<-paste(draw,draw1)
write(draw,file='test.gv')


