bbtraining_df <- read.csv("BlackBoxtrainApril22.csv")
boxplot(bbtraining_df$INPUT1 ~ bbtraining_df$SOUND, main = "INPUT 1 vs Sound", xlab = "Sound", ylab = "INPUT 1", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbtraining_df$INPUT2 ~ bbtraining_df$SOUND, main = "INPUT 2 vs Sound", xlab = "Sound", ylab = "INPUT 2",  col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbtraining_df$INPUT3 ~ bbtraining_df$SOUND, main = "INPUT 3 vs Sound", xlab = "Sound", ylab = "INPUT 3",  col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbtraining_df$INPUT4 ~ bbtraining_df$SOUND, main = "INPUT 4 vs Sound", xlab = "Sound", ylab = "INPUT 4",  col = c("purple", "gold", "light coral", "orange", "light green"))

mosaicplot(bbtraining_df$SOUND ~ bbtraining_df$SWITCH, main = "Switch vs Sound", xlab = "Switch", ylab = "Sound", col = c("purple", "gold", "light coral", "orange", "light green") )

bbminimum_df <- subset(bbtraining_df, bbtraining_df$SWITCH == "Minimum")
bblow_df <- subset(bbtraining_df, bbtraining_df$SWITCH == "Low")
bbmedium_df <- subset(bbtraining_df, bbtraining_df$SWITCH == "Medium")
bbhigh_df <- subset(bbtraining_df, bbtraining_df$SWITCH == "High")
bbmaximum_df <- subset(bbtraining_df, bbtraining_df$SWITCH == "Maximum")

boxplot(bbminimum_df$INPUT1 ~ bbminimum_df$SOUND, main = "INPUT 1 vs Sound(Minimum Switch)", xlab = "Sound", ylab = "INPUT 1",  col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbminimum_df$INPUT2 ~ bbminimum_df$SOUND, main = "INPUT 2 vs Sound(Minimum Switch)", xlab = "Sound", ylab = "INPUT 2",  col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbminimum_df$INPUT3 ~ bbminimum_df$SOUND, main = "INPUT 3 vs Sound(Minimum Switch)", xlab = "Sound", ylab = "INPUT 3",  col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbminimum_df$INPUT4 ~ bbminimum_df$SOUND, main = "INPUT 4 vs Sound(Minimum Switch)", xlab = "Sound", ylab = "INPUT 4",  col = c("purple", "gold", "light coral", "orange", "light green"))

boxplot(bblow_df$INPUT1 ~ bblow_df$SOUND, main = "INPUT 1 vs Sound(Low Switch)", xlab = "Sound", ylab = "INPUT 1", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bblow_df$INPUT2 ~ bblow_df$SOUND, main = "INPUT 2 vs Sound(Low Switch)", xlab = "Sound", ylab = "INPUT 2", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bblow_df$INPUT3 ~ bblow_df$SOUND, main = "INPUT 3 vs Sound(Low Switch)", xlab = "Sound", ylab = "INPUT 3", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bblow_df$INPUT4 ~ bblow_df$SOUND, main = "INPUT 4 vs Sound(Low Switch)", xlab = "Sound", ylab = "INPUT 4", col = c("purple", "gold", "light coral", "orange", "light green"))

boxplot(bbmedium_df$INPUT1 ~ bbmedium_df$SOUND, main = "INPUT 1 vs Sound(Medium Switch)", xlab = "Sound", ylab = "INPUT 1", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmedium_df$INPUT2 ~ bbmedium_df$SOUND, main = "INPUT 2 vs Sound(Medium Switch)", xlab = "Sound", ylab = "INPUT 2", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmedium_df$INPUT3 ~ bbmedium_df$SOUND, main = "INPUT 3 vs Sound(Medium Switch)", xlab = "Sound", ylab = "INPUT 3", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmedium_df$INPUT4 ~ bbmedium_df$SOUND, main = "INPUT 4 vs Sound(Medium Switch)", xlab = "Sound", ylab = "INPUT 4", col = c("purple", "gold", "light coral", "orange", "light green"))

boxplot(bbhigh_df$INPUT1 ~ bbhigh_df$SOUND, main = "INPUT 1 vs Sound(High Switch)", xlab = "Sound", ylab = "INPUT 1", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbhigh_df$INPUT2 ~ bbhigh_df$SOUND, main = "INPUT 2 vs Sound(High Switch)", xlab = "Sound", ylab = "INPUT 2", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbhigh_df$INPUT3 ~ bbhigh_df$SOUND, main = "INPUT 3 vs Sound(High Switch)", xlab = "Sound", ylab = "INPUT 3", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbhigh_df$INPUT4 ~ bbhigh_df$SOUND, main = "INPUT 4 vs Sound(High Switch)", xlab = "Sound", ylab = "INPUT 4", col = c("purple", "gold", "light coral", "orange", "light green"))

boxplot(bbmaximum_df$INPUT1 ~ bbmaximum_df$SOUND, main = "INPUT 1 vs Sound(Maximum Switch)", xlab = "Sound", ylab = "INPUT 1", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmaximum_df$INPUT2 ~ bbmaximum_df$SOUND, main = "INPUT 2 vs Sound(Maximum Switch)", xlab = "Sound", ylab = "INPUT 2", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmaximum_df$INPUT3 ~ bbmaximum_df$SOUND, main = "INPUT 3 vs Sound(Maximum Switch)", xlab = "Sound", ylab = "INPUT 3", col = c("purple", "gold", "light coral", "orange", "light green"))
boxplot(bbmaximum_df$INPUT4 ~ bbmaximum_df$SOUND, main = "INPUT 4 vs Sound(Maximum Switch)", xlab = "Sound", ylab = "INPUT 4", col = c("purple", "gold", "light coral", "orange", "light green"))

library(rpart)
library(rpart.plot)
library(CrossValidation)

tree <- rpart(SOUND ~ INPUT1 + INPUT2 + INPUT3 + INPUT4 + SWITCH, data  = bbtraining_df, method = "class", control = rpart.control(minsplit = 150, minbucket = 50, cp = 0.0001))
rpart.plot(tree)
prp(tree)

prediction <- predict(tree, bbtraining_df, type = "class")
head(prediction)

mean(bbtraining_df$SOUND == prediction)

cross_validate(bbtraining_df, tree, 5, 0.7)

bbtesting <- read.csv("BlackBoxTestApril22-students.csv", stringsAsFactors = T)
bbtestingpredict <- predict(tree, newdata = bbtesting, type = "class")
bbsubmission <- read.csv("BlackBoxTestApril22-submission.csv")
bbsubmission$SOUND = bbtestingpredict
write.csv(bbsubmission, "BlackBoxTestApril22-submission.csv", row.names = FALSE)
