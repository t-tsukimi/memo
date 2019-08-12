library(ggplot2)
library(gridExtra)

#データはいつものirisを使用
data(iris)

#基本形
g0 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot()

#y軸を%表示 (例としてはあまり良くないですが)
#scale_y_continuousでlabels = percent（scalesパッケージ）を選択
library(scales)
g1 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot()+ 
        scale_y_continuous(labels = percent)

#y軸を小数点を制御
#irisだと自動的に桁が揃えられるので4.51を導入
g2 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        scale_y_continuous(breaks = c(4.51, 5, 6, 7, 8)) 

#小数点第1位で統一
#scale_y_continuousは自作関数を適用できる。そこにformat関数を使用してやればいい
g3 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        scale_y_continuous(breaks = c(4.51, 5, 6, 7, 8), 
                           labels = function(x) format(x, digits = 2)) 

png("iris_ycontrol.png", res = 150, width = 2000, height = 1000)
grid.arrange(g0, g1, g2, g3, nrow = 2)
dev.off()


#点を追加
#geome_pointを追加すればいい
g4 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        geom_point()

#(例としてはおかしいが)点を線分で結ぶ
#geome_lineを追加して、group =で結ぶ要素を指定する
iris$subject <- rep(1:50, 3) #個体1~50の時系列変化する1変数を見ているのと同じ
g5 <- ggplot(iris, 
             aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        geom_point() + 
        geom_line(group = iris$subject)

#点が多くて見づらいので1種あたり6個にしてみる
g6 <- ggplot(iris[seq(1, 150, 5), ], 
             aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        geom_point() + 
        geom_line(group = iris$subject[seq(1, 150, 5)])

png("iris_box_dot_line.png", res = 150, width = 2000, height = 1000)
grid.arrange(g0, g4, g5, g6, nrow = 2)
dev.off()
