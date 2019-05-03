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
- launch.jsonは作業フォルダの.vscodeフォルダにある。vs codeの左端上から4つ目のデバッグアイコン→歯車アイコンで開けられる。開けられない場合はエクスプローラーからフォルダーを開く。
- デバッグはF5で開始し、F10で1行ずつ実行することが可能。行番号左をクリックすることでブレークポイントの設定ができる。
- デフォルトのPythonへのPathはsettings.json内のpython.pythonPathで変更できる。ない場合は追記すればいい([参考](https://code.visualstudio.com/docs/python/settings-reference#_general-settings))。  
<br>

### Python3
---
-  MacにPython3をインストール([参考](https://basicincome30.com/python-install-mac))
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

### 英語
---
- [Grammarly](https://app.grammarly.com/)：文法チェック。無料版でも十分な機能。機械的なチェックなので全て正しいわけではないが、MS Wordより詳細にチェックしてくれる。  
- [inMeXes](https://docman.dbcls.jp/im/)：論文に頻出する単語・熟語を高速に検索できる。統合TVで[使い方動画](https://togotv.dbcls.jp/20180126.html)が公開されている。  
<br>

### プログラミング学習
---
- [ドットインストール](https://dotinstall.com/)：様々な言語やIT関連の知識を3分程度の動画で学べる。コンテンツ数はプログラミング学習サービスの中で最も多いと思う。一部有料（月額980円）。
- [Progate](https://prog-8.com/)：様々な言語について「スライドで学習→テスト」を全てwebブラウザ上で実行できる。UIが秀逸で説明も分かりやすいので初めてプログラミングを勉強する人にお勧め。一部有料（月額980円）。
- [ディープラーニング入門](https://tutorials.chainer.org/ja/index.html)：株式会社Preferred Networksが提供する深層学習のチュートリアルだが、Pythonの初歩から説明しているためPython学習に有効。Google Colaboratoryを利用することで環境構築を行う必要がない。無料。  
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
<br>


### Git
---
- 複数のパソコンからgit pushするにはgithubにsshキーを登録する([参考](http://pyoonn.hatenablog.com/entry/2014/10/21/163852))。ただし、その場合でもコミットは別の人と認識される。
- 「failed to push some refs to ~」と表示されたときのはfetchしてmergeする([参考](https://qiita.com/takanatsu/items/fc89de9bd11148da1438))。