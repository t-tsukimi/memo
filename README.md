Author:Tomoya Tsukimi  
Last update:2019-04-19  
<font color="red">注意</font>：使用は自己責任でお願いします  
<br>  

### ユニバーサルカラーデザイン
---
[色盲の人にもわかるバリアフリープレゼンテーション法](https://www.nig.ac.jp/color/gen/)(国立遺伝学研究所)
- 「色盲」は遺伝的多型であって異常や障害ではないとする立場から「色覚異常」や「色覚障害」ではなく「色盲」という言葉を用いている。  
- 「色盲」の人の見え方、遺伝的背景が分かりやすく述べられている。  
- 参考：日本遺伝学会は2017年9月に従来の「色盲」に対して「色覚多様性(color vision variation)」という表現を用いることを決定しています。URLは[こちら](https://sv117.wadax.ne.jp/~gsj3-jp/revisionterm.html)。

[MS officeのユニバーサルデザインカラーパレット](http://www2.cudo.jp/wp/?p=5014)(カラーユニバーサルデザイン機構)
- Microsoft officeのカラーパレットです。このパレットに乗っている色を使えば全ての人に見やすいグラフやスライドが作成できます。
- Windows用は[こちら](http://www2.cudo.jp/wp/?p=4966)  
![](https://github.com/t-tsukimi/memo/blob/master/image/universal_color_palette-3.png)  


[Sim Daltonism](https://michelf.ca/projects/mac/sim-daltonism/)
- 異なる色覚多様性を持つ人にとってPC上の画像がどのように見えるかシミュレーションするMacアプリ。  
![](https://github.com/t-tsukimi/memo/blob/master/image/Sim_Daltonism_for_Mac.png)  
<br>

### VS Code
---
- [日本語表示](https://qiita.com/ntkgcj/items/e77331932c7983dea830)
- [Python拡張機能](https://marketplace.visualstudio.com/itemdetails?itemName=ms-python.python):エラーの提示や関数の補完・説明 
- コマンドパレット(mac)：command + shift + p
− 設定(mac)：command + ,
- 設定で文字のフォントをRicty、サイズを14に指定
- 拡張機能でテーマを[PaperColor Redux Theme](https://marketplace.visualstudio.com/items?itemName=mrworkman.papercolor-vscode-redux)に
- [Markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint):マークダウンファイルの作成支援  
- [Markdown PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)：マークダウンファイルをPDFやhtmlに変換。コマンドパレットを開いてpdfと入力する。  
- launch.jsonの13行目に「"stopOnEntry": true」を追記し、デバッグ環境を整える([参考](https://www.atmarkit.co.jp/ait/articles/1806/05/news023.html))。
- launch.jsonは作業フォルダの.vscodeフォルダにある。vs codeの左端上から4つ目のデバッグアイコン→歯車アイコンで開けられる。開けられない場合はエクスプローラー(虫眼鏡のアイコン)からフォルダーを開く。
- デバッグはF5で開始し、F10で1行ずつ実行することが可能。行番号左をクリックすることでブレークポイントの設定ができる。
- デフォルトのPythonへのPathはsettings.json内のpython.pythonPathで変更できる。ない場合は追記すればいい([参考](https://code.visualstudio.com/docs/python/settings-reference#_general-settings))。  
- pythonインタープリタに作成した環境が出ないときは、setting.jsonに読み込む環境を指定する。[参考](https://tekunabe.hatenablog.jp/entry/2018/12/28/vscode_venv_default_rolad)
<br>

### Python3
---
-  MacにPython3をインストール([参考](https://basicincome30.com/python-install-mac))
- Macにanacondaをインストール([参考](https://github.com/ghmagazine/python_stat_sample/blob/master/tutorial/env_const/macos.md))
```sh
brew install pyenv
#権限の問題でインストールできなかったので変更
sudo chown -R $(whoami) /usr/local/share/man/man8
chmod u+w /usr/local/share/man/man8

brew install pyenv
echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile #パスを通す

source ~/.bash_profile
pyenv install -l #インストールできるバージョンの表示
pyenv install 3.7.3 #mojaveだとエラーになる？(https://qiita.com/zreactor/items/c3fd04417e0d61af0afe)
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

pyenv install 3.7.3
python -m venv ~/your_venv/　# 仮想環境の作成
source ~/your_venv/bin/activate #仮想環境の有効化
deactivate #仮想環境の無効化

```
- 不要になったパッケージやキャッシュの削除([参考](https://weblabo.oscasierra.net/python-anaconda-clean/))
```sh
conda clean --all
```
- anacondaでpython2.7環境を作成する。
```sh
conda create -n py27 python=2.7 anaconda
```

#### [PEP8](https://www.python.org/dev/peps/pep-0008/#should-a-line-break-before-or-after-a-binary-operator)推奨事項
- 二項演算子の両端にはスペースを入れる
- 改行するときは二項演算子が先頭に来るようにする

#### その他メモ
- 関数内でグローバル変数の値を操作したいときは、関数内で「global 変数」と明記する。
- タプルに*をつければ複数の引数を一度に渡せる「function(*t)」。
- 浮動小数点型はeを使って表すことができる。15000は1.5e4と表せる。
- 要素が１つのタプルは直後にコンマが必要
```python
a = (2)
type(a)
#<class 'int'>
b = (3,)
type(b)
#<class 'tuple'>
```
- 関数の引数としてリストが渡され変更が加えられた場合、グローバルスコープでも有効になる([参考](https://worthliv.com/python_post_14.html))。
<br>

### Python2と3の違い
---
- Python3では「/」は真の除算 (true division) で実数になり、「//」は切り捨て除算 (floor division) で整数部分を返す。Python2では除数も被除数も整数の場合は「/」で切り捨て除算が行われ整数を返す。  
- python3はraw_inputがないため、inputを使用する。
- python3はprintが関数になっている。
- Python2のrange関数はリスト、python3のrange関数はジェネレータオブジェクトを返す（python2のxrangeに相当)。メモリ節約の点で2のrange関数よりも3の方が良い([参考](https://www.sejuku.net/blog/23145#Python3Python2range))。
```sh
list(range(0,10)) 
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
<br>

### Docker
---
- ストレージを圧迫しているキャッシュを削除する([参考](https://qiita.com/ktsujichan/items/726e0f896e30b355fee1))
- docker runのオプション（[参考](https://webdesign-manga.com/docker_run_option/)）: -it ホストとコンテナの標準入出力をつなげる, -v ホストとコンテナ間でファイルを共有する
```
rm -rf ~/Library/Containers/com.docker.docker/Data/*
```
- Cannot connect to the Docker daemon. Is the docker daemon running on this host?という表示が出た場合、一度Dockerをシャットダウンして再起動すれば問題なく起動する（ことがある）。
### google ドキュメント
---
- Code Blocks: コードをハイライトするアドオン ([参考](https://qiita.com/fbp-yamashita/items/a85302ee3b70fa407eb5))

### 英語
---
- [Grammarly](https://app.grammarly.com/)：文法チェック。無料版でも十分な機能。機械的なチェックなので全て正しいわけではないが、MS Wordより詳細にチェックしてくれる。  
- [inMeXes](https://docman.dbcls.jp/im/)：論文に頻出する単語・熟語を高速に検索できる。統合TVで[使い方動画](https://togotv.dbcls.jp/20180126.html)が公開されている。  
- [Life Science Dictionary Tool WebExtension](https://chrome.google.com/webstore/detail/life-science-dictionary-t/glamiehbjfdcihghdlcjlckipojhnocp/related?hl=ja)：chromeの拡張機能。マウスオーバーで英訳が表示される。  
- constrain: 辞書的な意味だと「束縛する」や「規制する」だが、「条件を設定する」のようなニュアンスか。[この論文](https://science.sciencemag.org/content/363/6423/181)のサプリp1下から4行目など。
<br>

### プログラミング学習
---
- [ドットインストール](https://dotinstall.com/)：様々な言語やIT関連の知識を3分程度の動画で学べる。コンテンツ数はプログラミング学習サービスの中で最も多いと思う。一部有料（月額980円）。
- [Progate](https://prog-8.com/)：様々な言語について「スライドで学習→テスト」を全てwebブラウザ上で実行できる。UIが秀逸で説明も分かりやすいので初めてプログラミングを勉強する人にお勧め。一部有料（月額980円）。
- [ディープラーニング入門](https://tutorials.chainer.org/ja/index.html)：株式会社Preferred Networksが提供する深層学習のチュートリアルだが、Pythonの初歩から説明しているためPython学習に有効。Google Colaboratoryを利用することで環境構築を行う必要がない。無料。  
- [「情報Ⅰ」教員研修用教材](http://www.mext.go.jp/component/a_menu/education/micro_detail/__icsFiles/afieldfile/2019/05/15/1416758_005.pdf): pythonベースで基礎が詳しく書かれている。
- [algorithm-visualizer.org](https://algorithm-visualizer.org/): アルゴリズムを可視化したものとそのコードが閲覧できる。
<br>

### その他の分野学習
---
- [JMOOC](https://www.jmooc.jp/): 日本語による「MOOC」（Massive Open Online Courses＝大規模公開オンライン講座）のポータルサイト。複数の配信プラットフォームに対して横断検索ができる。

### linuxコマンド
---
- wgetで保存先を指定
```sh
wget -P path/to/yourdir http://path/to/file.txt
```
- ジョークコマンド
```sh
brew install sl
sl #鉄板

brew install cmatrix
cmatrix #映画のmatrixっぽい感じ

brew install asciiquarium
asciiquarium #水族館、魚の種類がなかなか豊富

brew install nyancat
nyancat #nyancatが走るだけ、疲れたときは永久に見ていられる
```
![](https://github.com/t-tsukimi/memo/blob/master/image/nyancat.png)  
- [bashワンライナー集](https://onceupon.github.io/Bash-Oneliner/): 後でゆっくり見ておきたい。
<br>

### シェルスクリプト
---
- 引数の#0にはスクリプト名が格納される。なので実際の引数が格納されるのは#1から。
- [変数の置換方法](https://qiita.com/aosho235/items/c36568830a8d47288284)。  
<br>

### Macに入れると捗るもの
---
- [homebrew](https://brew.sh/index_ja): 様々なツールを「brew ○○」でインストールできる。
- [HyperSwitch](https://bahoom.com/hyperswitch): WindowsのAlt + tabのようにウインドウ単位で切り替えができる。
- [Skitch](https://evernote.com/intl/jp/products/skitch): スクショソフト。撮影した画像に記号やテキストを簡単に書き込める。Evernoteと連携しているためファイル管理も楽。
- [CopyClip](https://itunes.apple.com/jp/app/copyclip-clipboard-history/id595191960?mt=12): コピー履歴を保存でき選択してペーストできる。
- [Karabiner](https://pqrs.org/osx/karabiner/): キーボードの割り付けを行える。外付けキーボードを使用する際には必須。Windows用キーボードをMac用に設定するには[こちらの記事](https://mainguild.com/how-to-karabiner-elements/)が参考になる。Python書くときに便利なセミコロンをコロンにする方法は[こちら](https://pycarnival.com/semicolontocolon/)。  
- [BackgroundMusic](https://github.com/kyleneideck/BackgroundMusic): アプリごとに細かい音量調整が行える。
- Time machine: 最初から入っている。バックアップに便利。PCのストレージ容量が10GBを切るとうまくバックアップされないことがあるので注意。
- [OnyX](https://www.titanium-software.fr/en/onyx.html): お掃除アプリ。「メンテナンス」を実行すると不要なログファイルなどを削除してくれる。この後にセーフモードで再起動すればある程度は容量が空く。
<br>


### Git
---
- 複数のパソコンからgit pushするにはgithubにsshキーを登録する([参考](http://pyoonn.hatenablog.com/entry/2014/10/21/163852))。ただし、その場合でもコミットは別の人と認識される。
- 「failed to push some refs to ~」と表示されたときのはfetchしてmergeする([参考](https://qiita.com/takanatsu/items/fc89de9bd11148da1438))。
- [Steins;Git](https://o2project.github.io/steins-git/): Steins;Gateの世界観を通してGitを分かりやすく説明。ネタバレがあるので必ずSteins;Gateプレイ後に参照すべき。
- [わかばちゃんと学ぶ Git使い方入門](https://www.amazon.co.jp/%E3%82%8F%E3%81%8B%E3%81%B0%E3%81%A1%E3%82%83%E3%82%93%E3%81%A8%E5%AD%A6%E3%81%B6-Git%E4%BD%BF%E3%81%84%E6%96%B9%E5%85%A5%E9%96%80-%E6%B9%8A%E5%B7%9D%E3%81%82%E3%81%84-ebook/dp/B071D4D6XX): Gitを知らない人でもとりあえずこの1冊があれば、clone, add, push, commitは実行できるようになる。
- 新しくレポジトリを作成するときの手順  
```sh
#記録したいフォルダに移動
git init
git add 記録したいファイル名
git commit -m "初期コミット"
git remote add origin https://github.com/t-tsukimi/レポジトリ名.git
git push origin master
```
<br>  


### QIIME2のインストール（後で正式なものを作成する）
---
#### pyenvにインストールする場合
```sh
#minicondaのインストール 
pyenv install —list 
pyenv install miniconda3-4.3.30 

#minicondaがきちんとインストールされたか確認 
pyenv install versions 

#miniconda環境に切り替え、古いパッケージをアップデート&wgetをインストール 
pyenv global miniconda3-4.3.30 
conda update conda 
Yes 
conda install wget 

#qiime2のファイルをダウンロードし、qiime2環境を構築 
wget https://data.qiime2.org/distro/core/qiime2-2019.4-py36-osx-conda.yml 
conda env create -n qiime2-2019.4 --file qiime2-2019.4-py36-osx-conda.yml 

#QIIME2を起動 
source activate qiime2-2019.4 
qiime --help 
#これでエラーが出ずにヘルプが表示されればインストール成功
```
- 以降使用する際は以下の通り
```sh
#今の環境を確認する 
pyenv install versions 
#miniconda環境出ない場合、miniconda環境に切り替え 
pyenv global miniconda3-4.3.30 
#qiime2を起動 
source activate qiime2-2019.4 

#終了 
conda deactivate 
```
- なお、[QIIME2の公式マニュアル](https://docs.qiime2.org/2019.4/install/native/)での起動は上記の通りだが、QIIME2インストール終了後に表示される起動方法は「conda activate qiime2-2019.4」だった。
- anaconda3-5.3.1にはなぜかインストールできなかった。  
- 上記の方法でできなければVirtual BoxかDockerで入れることも可能。
#### Dockerでインストールする場合
```sh
docker pull qiime2/core:2019.7
docker run -t -i -v $(pwd):/data qiime2/core:2019.7 qiime #ヘルプが表示されれば成功
```  
<br>  

### Adobe
---
- Illustrator 2019では「テンプレートとして保存」をクリックしても管理者権限がないと表示される。一度別の場所に保存し、「/Applications/Adobe Illustrator CC 2019/Cool Extras/ja_JP/テンプレート」に移動させれば良い（このときパスワードの入力が必要）。[参考](https://forums.adobe.com/thread/2569345)

### R
---
- install.pachageでソースファイルからインストールしようとするとコンパイルでこけることがある。その場合は"install from source?"という質問に対して"n"と回答すれば良い。
![](https://github.com/t-tsukimi/memo/blob/master/image/R_compilation.png)  
- veganパッケージは2.5-1ではdbrda関数が使用できなかった。2.5-4にアップデートするとできた。 
- プロットの解像度は画像保存系関数のresがdpiに対応している（論文では300 dpi以上が推奨されるのでres = 300を指定すれば良い）。[参考](http://www.proton.jp/main/apps/r/resolution.html)
- 散布図
```r
rm(list = ls())

library(ggplot2)
library(rgl)

dt <- iris
colnames(iris)
# [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
# [5] "Species"  

#ggplot2で二次元プロット
png(file = "iris_2d.png")
g <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_classic()
g
dev.off()

#rglで3次元プロット
plot3d(dt[, 1:3], col = rainbow(3)[dt$Species], size = 4)
rgl.postscript("iris_3d.svg", fmt = "svg")
```
![](https://github.com/t-tsukimi/memo/blob/master/image/iris_2d.png)
![](https://github.com/t-tsukimi/memo/blob/master/image/iris_3d.svg)  
- 複数のグラフを1つにまとめる([参考](https://qiita.com/nozma/items/cd98ec7938e0783d5d89))。
```r
library(gridExtra)
library(ggplot2)

dt <- iris
#ggplot2のテーマを比べてみる
g1 <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_void()
g2 <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_classic()
g3 <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_bw()
g4 <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_gray()
g5 <- ggplot(data = dt, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point() + 
        theme_dark()

png("4graphs.png", res = 150, width = 2000, height = 1000)
grid.arrange(g1, g2, g3, g4, g5, nrow = 2)
dev.off()
```
![](https://github.com/t-tsukimi/memo/blob/master/image/4graphs.png)

- y軸の値を制御する（[参考1](https://stackoverflow.com/questions/27433798/how-can-i-change-the-y-axis-figures-into-percentages-in-a-barplot), [参考2](https://www.karada-good.net/analyticsr/r-64)）。
```r
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
```
![](https://github.com/t-tsukimi/memo/blob/master/image/iris_ycontrol.png)

- 箱ひげ図の上から点を線分で結ぶ
```r
library(ggplot2)
library(gridExtra)

#データはいつものirisを使用
data(iris)

#基本形
g0 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot()

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
        #データによってはgeom_line(aes(group = iris$subject))でないとうまく反映されないケースもある。

#点が多くて見づらいので1種あたり6個にしてみる
g6 <- ggplot(iris[seq(1, 150, 5), ], 
             aes(x = Species, y = Sepal.Length, fill = Species)) + 
        geom_boxplot() + 
        geom_point() + 
        geom_line(group = iris$subject[seq(1, 150, 5)])

png("iris_box_dot_line.png", res = 150, width = 2000, height = 1000)
grid.arrange(g0, g4, g5, g6, nrow = 2)
dev.off()

```
![](https://github.com/t-tsukimi/memo/blob/master/image/iris_box_dot_line.png)

- ランダムフォレストにおける前処理の重要性
- 試しに完全にランダムな変数を追加した場合、識別精度は下がるのか
- 結果としてランダムな変数をモデルに組み込むと識別精度が約2%下がった。
```r
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
```
- 相関係数の算出と作図
- 作図の体裁を整えるには「[データ科学便覧　Rによる散布図の描画](https://data-science.gr.jp/implementation/ida_r_scatter_plot.html)」などが参考になる。
```r
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
```
![](https://github.com/t-tsukimi/memo/blob/master/image/190913_correlation_lm.png)  



<br>  

### プレゼン
---
- [これだけ守れば見やすくなるデザインの基礎](https://speakerdeck.com/kinakobooster/koredakeshou-rebajian-yasukunarudezainfalseji-chu): デザイナーさんによるデザイン資料。伝えることに優先順位をつけて認知不可を下げることが重要とのこと。  
<br>  

### バイオインフォマティクス
---
- [先進ゲノム支援　中級者向け情報解析講習会](https://www.genome-sci.jp/lecture20181st): 2018年の11月19-21日に開催された講習会。Pythonプログラミングの基礎から多変量解析、機械学習まで。web上に動画及びコードも全てアップされているので独学も可能。
- エントロピー: 生物学においては塩基配列の偏りを示す際に用いられる。0-2で塩基の偏りが強いほど0に近づく。[参考](https://slidesplayer.net/slide/16557467/)
- 有限オートマトン: 主にモチーフ解析などに使用される。[参考](http://www.dna.bio.keio.ac.jp/lecture/bioinfo/bioinformatics-5.pdf)  
- [CellMarker](http://biocc.hrbmu.edu.cn/CellMarker/index.jsp): 細胞のマーカー遺伝子を検索できる。 
<br>  


### 統計
---
- [とてもとても難しい 一般化線形モデル with R](http://cogpsy.educ.kyoto-u.ac.jp/personal/Kusumi/datasem13/shrasuna1.pdf): 一般化線型モデルについてコンパクトにまとまっている。
- [感度・特異度・ROCK曲線(藤田保健衛生大学柿崎先生)](http://jeaweb.jp/activities/files/contest2016_1.pptx): 2016年度日本疫学会スライドコンテスト受賞作品、イメージ図が多く使われており分かりやすい。
- [医療統計勉強会-第5回比率と分割表(東北大学宮田先生)](http://www.cardio.med.tohoku.ac.jp/newmember/pdf/ms/15_5T.pdf): 具体的なデータが用いられているので上の資料でイメージをつかんでもらった後におすすめ。

<br>  

### コンピュータ
---
- [PASSMARK](https://www.passmark.com/): CPUなどのベンチマークサイト
- ここ1週間ほどmacのエクセル2016で「ファイル形式またはファイル拡張子が正しくありません」と表示される。エクセルを最新バージョン（16.27(19071500)）にアップデートすると直った。
<br>  



### 文章・レポート作成
---
- [菌名の記載ルール](http://kuchem.kyoto-u.ac.jp/seika/shiraishi/note/report.html)
<br>  

### 分類
---
- [門外漢のための「学名」のはなし](https://www.jstage.jst.go.jp/article/kagakutoseibutsu1962/42/2/42_2_99/_pdf/-char/ja)
<br>  


### ランダムフォレスト
---
- ブートストラップサンプリング: N個の標本から<u>**重複を許して**</u>N個をサンプリングすること。
- OOB(Out-Of-Bag): ブートストラップサンプリングで選ばれなかったサンプル。これを用いてモデル精度が評価される(OOB error)。理論的にはネイピア数の逆数(約36%)になる。[参考](https://qiita.com/kenmatsu4/items/1152d6e5634921d9246e)

### バックアップ
---
- BaffaloのNASをTime Machineの保存先に設定する([参考](https://www.buffalo.jp/support/faq/detail/15092.html))。Webからの設定は反映に時間がかかることがある。

### markdown
---
- pdfは画像とみなされないのか「![](URL)」でも反映されない。


### 可視化
---
- [PlotsOfData](https://huygens.science.uva.nl/PlotsOfData/): 棒グラフ、箱ひげ図、バイオリンプロットのきれいな図をwebで作成できる。

### PC周辺器
---
- EPSONのプリンターでスキャンした画像をPCに取り込む。  
1. 書類をスキャナに置く
2. プリンタとスキャナ→スキャナをクリック
3. スキャナの状態が読み取られるので、確認してスキャンをクリック


### 危機管理
---
[重大事故のときにどうするか](https://note.mu/mmiya/n/n746eb2e36f81): ヤフー重大事故のときに陣頭指揮をとられた人の記事。リーダーが行うべき10項目が記されている。