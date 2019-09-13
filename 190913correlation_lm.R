rm(list = ls())

data(iris)
head(iris)
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa


#花弁(Petal)の長さ(Length)と幅(Width)の相関をとってみる
cor(iris$Petal.Length, iris$Petal.Width, method = "pearson")
# [1] 0.9628654
cor(iris$Petal.Length, iris$Petal.Width, method = "spearman")
# [1] 0.9376668

#相関係数の検定を行う
cor.test(iris$Petal.Length, iris$Petal.Width, method = "pearson")
# Pearson's product-moment correlation
# 
# data:  iris$Petal.Length and iris$Petal.Width
# t = 43.387, df = 148, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
# 0.9490525 0.9729853
# sample estimates:
# cor 
# 0.9628654 
cor.test(iris$Petal.Length, iris$Petal.Width, method = "spearman")
# Spearman's rank correlation rho
# 
# data:  iris$Petal.Length and iris$Petal.Width
# S = 35061, p-value < 2.2e-16
# alternative hypothesis: true rho is not equal to 0
# sample estimates:
# rho 
# 0.9376668 
# 
# 警告メッセージ: 
# cor.test.default(iris$Petal.Length, iris$Petal.Width, method = "spearman") で: 
# タイのため正確な p 値を計算することができません 

#プロットしてみる
plot(iris$Petal.Length, iris$Petal.Width)
#回帰曲線を追加する
lr <- lm(iris$Petal.Width ~ iris$Petal.Length) #回帰直線のモデルを作成
abline(lr) #plotに追記

#ファイルに保存
png("190913_correlation_lm.png", width = 1440, height = 1440, res = 300)
plot(iris$Petal.Length, iris$Petal.Width)
lr <- lm(iris$Petal.Width ~ iris$Petal.Length)
abline(lr)
dev.off()
