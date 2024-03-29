library(pIR)

setwd("/home/rui-huang/Documents/RNA_seq_doc/NCR_clustering")

df = read.table("mature_NCR_tab.txt")

name = c()
PI_list = c()
for (i in 1:nrow(df)) {
  sub_df = df[i,]
  id = as.character(sub_df$V1)
  pred = computeAllIterativeValues(sub_df$V2)
  
  PI = pred[,2]
  PI_1 = PI[PI < max(PI)]
  PI_2 = PI_1[PI_1 > min(PI)]
  PI_mean = mean(PI_2)

  name = c(name,id)
  PI_list = c(PI_list,PI_mean)
  }

PI_df = data.frame("id" = name,
                   "PI" = PI_list)

write.csv(PI_df,"NCR_PI_table.txt",row.names = FALSE,quote = FALSE)



