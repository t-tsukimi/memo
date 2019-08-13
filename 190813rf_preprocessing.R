library(randomForest)
data(iris)

head(iris)
train_target <- c(1:30, 51:80, 101:130)
iris_train <- iris[train_target, ] #6割train、4割test
iris_test <- iris[-train_target, ]

iris_model <- randomForest(Species ~ ., iris_train, ntree=1000)
plot(iris_model)

prediction <- predict(iris_model, newdata = iris_test[,1:4])
answer = c(rep("setosa", 20), rep("versicolor", 20), rep("virginica", 20))
correct <- 0
for (i in 1:length(prediction)) {
        if(prediction[i] == answer[i]) {
                correct <- correct + 1
        }
}
correct / 60
#[1] 0.9833333

#ランダムな変数を混ぜてみる
set.seed(190813)
iris_dummy <- cbind(iris, rnorm(150, 5, 1))
colnames(iris_dummy)[6] <- "dummy"

iris_train <- iris_dummy[train_target, ] #6割train、4割test
iris_test <- iris_dummy[-train_target, ]

iris_model <- randomForest(Species ~ ., iris_train, ntree=1000)
plot(iris_model)

prediction <- predict(iris_model, newdata = iris_test[,c(1:4, 6)])
answer = c(rep("setosa", 20), rep("versicolor", 20), rep("virginica", 20))
correct <- 0
for (i in 1:length(prediction)) {
        if(prediction[i] == answer[i]) {
                correct <- correct + 1
        }
}
correct / 60
# [1] 0.9666667
# 精度は2%ほど下がった。