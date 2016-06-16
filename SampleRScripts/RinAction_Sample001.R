library(vcd)

counts <- table(Arthritis$Improved)
counts
barplot(counts,main="Simple Bar Plot",xlab="Improvement", ylab="Frequency")

barplot(counts,
        main="Horizontal Bar Plot",
        xlab="Frequency", ylab="Improvement",
        horiz=TRUE)

plot(Arthritis$Improved, main="Simple Bar Plot", xlab="Improved", ylab="Frequency")
plot(Arthritis$Improved, horiz=TRUE, main="Horizontal Bar Plot",xlab="Frequency", ylab="Improved")

counts<-table(Arthritis$Improved,Arthritis$Treatment)
barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow","green"),
        legend=rownames(counts))
barplot(counts,
        main="Grouped Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)

states<-data.frame(state.region,state.x77)

means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)

