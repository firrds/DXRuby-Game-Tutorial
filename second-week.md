第二週目
========

配列は下記プログラムの様に、
最初からデータを入れた状態で宣言する事も出来ます。

```ruby
#ここのサンプルは純粋なrubyの書き方です。dxrubyのものではありません。
foo = "ABC"
test = "DEF"
arraytest = [foo,test,"Hello"]

# arraytestという配列の中にある個別のデータを出す時は[0]のように番号を指定すればいいです。
print(arraytest[0]) #=> "ABC"
print(arraytest[1]) #=> "DEF"
print(arraytest[2]) #=> "Hello"

# arraytestという配列にあるすべてのデータを一気に出す場合は配列名だけでいいです。
print(arraytest)    #=> ["ABC","DEF","Hello"]
```

この様な記述の方法を使う事で、
Sprite データを画面に表示する時のプログラムを纏める事が出来ます。

#### 問題 1.
これを利用し、
第一週目の問題 4. で作成したプログラムに存在している Sprite.draw の部分を 1 行に纏めて下さい。

[回答](./answer/q2-1.rb)



### Map の作り方

Map という名前がついてる為、キャラクタとは異なるモノを連想しがちですが、
基本的に  Map も画像を並べているだけ
(障害物や人等の意味合いをもたせるのはあくまでもプログラムの仕事) で、
自分が表現したいように画像を並べる方法を覚えると、
簡単に Map を生成することが出来ます。

Map を作成するには、既に習った配列と繰り返しを使用する事で出来ます。
手作業で Map を作成する場合、
下記の様なプログラムを作成する事になります。

```ruby
require 'dxruby'

image_box = Image.load_tiles("./images/colorbox.png", 6, 1)

gray1 = Sprite.new(0,0,image_box[5])
gray2 = Sprite.new(20,0,image_box[5])
gray3 = Sprite.new(40,0,image_box[5])
gray4 = Sprite.new(60,0,image_box[5])
gray5 = Sprite.new(80,0,image_box[5])
gray6 = Sprite.new(100,0,image_box[5])
gray7 = Sprite.new(120,0,image_box[5])
gray8 = Sprite.new(140,0,image_box[5])
gray9 = Sprite.new(160,0,image_box[5])
gray10 = Sprite.new(180,0,image_box[5])

Window.loop do
  Sprite.draw(gray1)
  Sprite.draw(gray2)
  Sprite.draw(gray3)
  Sprite.draw(gray4)
  Sprite.draw(gray5)
  Sprite.draw(gray6)
  Sprite.draw(gray7)
  Sprite.draw(gray8)
  Sprite.draw(gray9)
  Sprite.draw(gray10)
end
```

上記プログラムを実行してみると、
少しばかりのブロックが生成されている事が分かります。


 __ここでおさらいです。__ 
写真を描画するってどういう手順を踏むのでしょうか？第1周目の授業ではキャラクターを描きましたね。
では、ひとつのブロック(gray1という配列)について、コードを追ってみましょう。
以下は、一つのブロック(gray1)のみ描くプログラムです。
手順は、大きく、3つに分かれます。
1つめは情報への準備、2つめは情報を得ること、3つめは情報を描くことです。

```ruby
require 'dxruby'

image_box = Image.load_tiles("./images/colorbox.png", 6, 1) #[1]

gray1 = Sprite.new(0,0,image_box[5])                        #[2]

Window.loop do                                          #[3]
  Sprite.draw(gray1)
end
```
[1] 情報への準備・・・・配列Aに写真をいれる
```ruby
image_box = Image.load_tiles("./images/colorbox.png", 6, 1)  # 配列A = image_box.load_tiles("写真のファイルの場所",x分割数,y分割数)
```
ブロックの写真がそれぞれ入った、image_box[0]～image_box[5]の配列が出来ます。
これで、写真が入った、配列 image_boxを使うことが出来るようになります。
灰色のブロックの写真が入っているimage_box[5]を使用します。
以下に図でさらに詳しく解説します。

![_ 1-1](https://user-images.githubusercontent.com/19345982/34082620-f53adb1e-e3a4-11e7-8e65-3cf94ba2429f.png)

[2] 具体的な情報を得ること・・・・配列Bに、どこの座標から描くのか、どんな写真なのか(配列A)の情報をいれる
```ruby
gray1 = Sprite.new(0,0,image_box[5]) # 配列B = Sprite.new(x座標,y座標,配列A)
```
この一行によって、gray1の情報が具体的になります。
gray1は、(0,0)の座標から描画されるということ、さらに、上記[1]で示したように、image[5]の灰色のブロックの写真であるという具体的な情報を得ます。
以下に図で示しますので、イメージしてみて下さい。
gray1は配列であるということ、はじめて聞いたかもしれませんが、覚えておいて下さい。
　※ Spriteについて、詳しく知りたい場合、以下URLを参考にしましょう。
 　　　http://dxruby.osdn.jp/DXRubyReference/201272119113718.htm

![gray1 1-1](https://user-images.githubusercontent.com/19345982/34100441-c4403654-e425-11e7-831e-ccf326299462.png)

[3] 情報を描くこと・・・・ 配列Bを描く
```ruby
Window.loop do #永遠に、1秒間毎に30回まわる
  Sprite.draw(gray1)  # Sprite.draw(配列B)
end
```
loopは1秒間毎に30回、永遠にまわる命令でしたね。Sprite.draw(gray1)で、Windowに上記[2]の情報を持った、gray1を描きます。
つまり、1秒間に30回、Windowにgray1(gray1の情報：(0,0)から描かれる、image_box[5]の灰色のブロックの写真)が描かれるということです。

![gray1 1-1](https://user-images.githubusercontent.com/19345982/34100486-ec81e914-e425-11e7-9897-8b708664b81c.png)

![gray1 2-1](https://user-images.githubusercontent.com/19345982/34100398-a5e49e02-e425-11e7-8645-ee0bcbfcf63a.png)

ここでおさらいは終わります。


上記のようにひとつひとつのブロックを分けて描画すると
本格的なゲームだけでなく、
簡単なゲームを作るだけでもかなりの労力を伴います。
その為、繰り返しを使う訳です。

上記のプログラムを繰り返しを使用して書き直すと下記の様になります。

```ruby
require 'dxruby'

block_x = 0
block_y = 0
count = 0
sprites = []

image_box = Image.load_tiles("./images/colorbox.png", 6, 1) # [1] 配列Aに写真を入れる(情報への準備)

loop do
  sprites[count] = Sprite.new(block_x, block_y, image_box[5]) # [2] 配列Bにx座標、y座標、写真が入った配列Aを入れる(具体的な情報を得る)
  if 180 < block_x
    break
  end
  block_x = block_x + 20
  count = count + 1
end

Window.loop do
  Sprite.draw(sprites) # [3] 配列BをWindowに描く(情報を描く)
end
```

block_x の値を 20 ずつ増やしているのは
block が 1 つ辺り 20x20 px のサイズだからです。
この様な方法で敷き詰めると、Map の形式になります。

### Window のサイズについて

少しタイミング的に遅くなりましたが、
Window のサイズの変更に関して説明します。

DXRuby において、WIndow のサイズを変更するのは簡単です。
``Window.width`` や ``Window.height`` という変数の数値を変更する事で
サイズが変わります。

```ruby
Window.width = 360
Window.height = 480

Window.loop do
end
```

上記プログラムで Window のサイズが変更出来る事が確認出来ます。
各自確認して下さい。
因みに、入れる数値 (サイズ)は px (ピクセル) を単位としています。

#### 問題 2.

Window のサイズを 300x300 px に設定し、
画面の上下左右端を全て block で埋める様にプログラムを作成して下さい。
この時、キャラクタは作成する必要はありません。


[回答](./answer/q2-2.rb)
[解説ビデオ](https://drive.google.com/file/d/1FgiaZZW8x9QYlEk7PG303R-l_HRjx3vr/view?usp=sharing)

ヒント：
以下のように図を書いて、ブロックの座標がどう変化しているかをたしかめましょう。
変化しているデータと変化していないデータがあります。
変化しているデータは、どのように変化しているでしょうか。規則性がありませんか？

![-](https://user-images.githubusercontent.com/19345982/34082019-3e684c28-e39a-11e7-96f9-ee4376b3bc23.png)

![1-1](https://user-images.githubusercontent.com/19345982/34082125-078630b0-e39c-11e7-89ad-96e5b947af81.png)

![-](https://user-images.githubusercontent.com/19345982/34082038-68040aea-e39a-11e7-96ca-cfb5b2263a8a.png)

![1-1](https://user-images.githubusercontent.com/19345982/34082139-3805be54-e39c-11e7-8c24-78a48b2dfef0.png)

![1-1](https://user-images.githubusercontent.com/19345982/34083775-28b75b84-e3b9-11e7-9a4b-5ba38213efcb.png)

![-](https://user-images.githubusercontent.com/19345982/34082044-81cf09b6-e39a-11e7-8a6e-aa667affa497.png)

![1-1](https://user-images.githubusercontent.com/19345982/34082166-a7032b70-e39c-11e7-8ef7-d4c0d421ffaa.png)

![-](https://user-images.githubusercontent.com/19345982/34082055-a3b6611e-e39a-11e7-9f02-0b48e8cc6794.png)

![1-1](https://user-images.githubusercontent.com/19345982/34082175-cca522e8-e39c-11e7-8125-5b77b2a432c9.png)

さらにヒント：

![_ 1-1](https://user-images.githubusercontent.com/19345982/34119877-08df2270-e467-11e7-93a9-4ab9a2eb65ad.png)

![_ 1-2](https://user-images.githubusercontent.com/19345982/34119903-1ea413cc-e467-11e7-9e05-e47ba53f8aa7.png)

![_ 1-3](https://user-images.githubusercontent.com/19345982/34119924-31c8d1fe-e467-11e7-8be3-92d46584b079.png)

![_ 1-4](https://user-images.githubusercontent.com/19345982/34119948-493dcd58-e467-11e7-8746-de4dbbabc786.png)

※ 補足・・・loopを抜けて終了する箇所は、以下のようにしてもOKです。ただ、今回、xの変化量とyの変化量は同じ、つまり同じ回数ループするため、xのみ判定しています。以下の ??? は同じ数字が入ります。
```ruby
if ??? == x || ??? == y
  break
end
```

#### 問題 3.

問題 2 で作ったプログラムにキャラクタを追加して下さい。
そのキャラクタは block に衝突した時、すり抜けない様にして下さい。

衝突判定に使用する ``===`` は配列を扱う事も出来ます。
なので、Sprite データのみを入れた配列同士、
もしくは変数と配列の組み合せであればまとめて判定を行なう事が出来ます。
上手く利用して下さい。

[回答](./answer/q2-3.rb)
[解説ビデオ](https://drive.google.com/file/d/10Xr1DIeRASHD93LATGp7gqmBET5dbq7T/view?usp=sharing)



### アクションゲームの形を作る

これから、単純なアクションゲームを作成して行きたいと思います。
まず、先程出て来た Map を作成するプログラムを利用して足場を作成したい
と思います。

```ruby
Window.width = 360
Window.height = 480

image_box = Image.load_tiles("./images/colorbox.png", 6, 1)

block_x = 0
block_y = 460
blocks = []
count = 0

loop do
  blocks[count] = Sprite.new(block_x, block_y, image_box[5])
  if 340 <= block_x
    break
  end
  count = count + 1
  block_x = block_x + 20
end

Window.loop do
  Sprite.draw(blocks)
end

```

このプログラムによって足場を作成出来たのが確認出来ると思います。
後はキャラクタを作成し、世界に重力を与えるとゲームの様相を見せてきます。
そこで、問題です。

#### 問題 4.

先程のプログラムにキャラクタを登場させて下さい。
その時、キャラクタはブロックより上の位置に登場し
(ブロックより上で、画面内であればどこでも可)、
ブロックに衝突するまで下に移動し続ける事を条件とします。

[回答](./answer/q2-4.rb)
[解説ビデオ](https://drive.google.com/file/d/1oayFqI8YadBUK39en2i5roO0TkHpSuvM/view?usp=sharing)

#### 問題 5.

また、問題 4 で作成したプログラムに、
矢印キーで左右に移動出来る機能を付けて下さい。
この時、キャラクタが画面の外に出る事について、
行動を制限する機能を入れる必要はありません。


[回答](./answer/q2-5.rb)
[解説ビデオ](https://drive.google.com/file/d/1EJbBOyTA2y2lcDHakSkfanspmUNJ1HkN/view?usp=sharing)



### ゲームの要素を加える

ここまででは、入れ物と登場キャラクタが存在するだけで
肝心のゲームとして遊ぶ機能が足りません。
なので、その要素を追加したいと思います。

アクションゲームと言っているので
様々な要素が考えられると思いますが、
まずは物が落ちて来る要素を入れたいと思います。

物が落ちて来るというのは、
今迄の学習から考えると、
画像が画面の上部から降りてくる事だと分かります。

画像には、block の灰色以外の物を使いたいと思います。

```ruby
item_x = 100
item_y = 0
item = Sprite.new(item_x, item_y, image_box[0])

Window.loop do
  item.y += 1
  Sprite.draw(item)
end
```

上記プログラムの image 変数は、
既に読み込んでいる (筈の) block の画像を想定しています。
なので、各自 block 画像を保持している変数を指定して下さい。

また、ブロックを状況によって消したいという事もあるので、
消し方についても解説します。

Ruby では、変数を消すには nil を変数に代入します。

下記の用に書きます。

```ruby
item = nil
```

ブロックを消す時も同様の書き方が出来ますが、
少し気を付ける必要があります。
基本的に、nil とは変数が値を持た無いという意味を持つ為、
エラーをおこす事があります。
そして ``Sprite.draw`` は nil を持つ変数を与えると
エラーになります。

その為、``Sprite.draw`` は変数が nil を持つ際に避ける条件をつけます。

```ruby
if item.nil? == false
  Sprite.draw(item)
end
```

if の書き方に新しい書き方が出て来ました。
``.nil?`` というのは変数の中身が nil かどうかを調査する書き方です。
nil の時は ``true`` を返し、それ以外のデータが入っている時は ``false``
を返します。

#### 問題 6.

現状では、item が落ちてくるだけで何も起らないので
キャラクタが item に触った時に消える用にして下さい。

[回答](./answer/q2-6.rb)
[解説ビデオ](https://drive.google.com/file/d/1Lkx6HVoCV3bpIY8l3CjrkAkOuCDY1yPt/view?usp=sharing)

#### 問題 7.

itemが消えた後、
最初にitemが出てきた位置から再度落ちて来る様にして下さい。
再出現は、キャラクタが item に触って消える限り無限に繰り返して下さい。

[回答](./answer/q2-7.rb)
[解説ビデオ](https://drive.google.com/file/d/1UIEEcfFZoyMWamrLf1U_XWMMZxVFhiBx/view?usp=sharing)

### ブロックの出現場所を制御する

itemの出現と消去、再出現までを作成しましたが、
延々と同じ場所から出現し続けるのではゲームになりません。

なので、出現する位置を出る度に変更したいと思います。
大抵のプログラミング言語にはランダムに数値を作成する機能があります。
Ruby のランダムメソッドはこの様に使用します。

```ruby
x = rand(340)
```

rand メソッドの () には数値を入れる事が出来ます。
() に入れた数値未満の値を得る事が出来ます。
但し、0 を与えた場合のみ小数点を返します。

今回はこのメソッドを使って、
ブロック出現時の X 座標に関する位置をランダムにします。

```ruby
item = nil

Window.loop do
  if item.nil? == true
    x = rand(340)   # item == nilの場合、if文の中に入る
    item = Sprite.new(x, y, image_box[0])
  end

  Sprite.draw(item)
end
```

このプログラムには、itemを消す要素は入れていません。
その為、itemを消す要素が必要な場合は別途入れて下さい。

itemが存在するかどうかをチェックした後、
存在しない場合は変数 x の値を rand メソッドによって
ランダムな値に変更します。
この時、340 を指定しているのは、
itemのサイズは 20x20 で、画面サイズは 360 を想定している為、
360 - 20 で 340 となります。
何故数値の差を求める必要があるかと言うと、
画像を表示する時に基準として指定した値を原点 0 として
ゲームの画面上に描画する為、
表示したい画像のサイズ分だけ画面の端から空けておく必要があります。
そうしないと、画面の外に画像がはみでる事になります。

また、逆側 (マイナス座標に対して) は、
指定した座標を原点に捉える為、
画像の座標がマイナスにならなければ、はみ出る事はありません。

#### 問題 8.

問題 7 で作成したプログラムを
itemがランダムに出現する様に変更して下さい。

[回答](./answer/q2-8.rb)
[解説ビデオ](https://drive.google.com/file/d/1gld2cnVrckaKYk3drGrZGp1LvBqWJb47/view?usp=sharing)


### ゲームにテキストを表示する

ここまで来ると、大分ゲームらしくなってきます。
キャラクタは自由に移動し (左右のみですが)、
ランダムにitemを落し、
それを取得する様になったので動きが多いですよね。

ただひたすら落ちてくるitemを取得し続けるゲームも
それはそれで良いのですが、
どうせならやる気が出る様な内容にしたいとも思います。

そこで、ゲームにスコアの機能を付けたいと思います。

スコアとは成績の事です。
ゲーム結果に成績を付けるとなると、
テキスト (要するに文字の事) を表示する必要があります。

ゲームの画面に文字を表示するには下記の様に記述します。

```ruby
# coding: utf-8
require 'dxruby'

font = Font.new(32)

Window.loop do
  Window.draw_font(100, 100, "ふぉんと", font)
end
```

実際に新しくプログラムを作成して確認してみて下さい。
"ふぉんと" という文字が表示されていると思います。
フォントを表示する際に注意する点として、
font 変数に渡しているデータの作成があります。

``Font.new`` で行なっている作業は、
ゲーム内で使用するフォントのサイズの指定です。
後に Window.draw_font というメソッドで作成した
font 変数を使用しています。
このメソッドを呼び出した時点で描画されるので注意して下さい。

#### 問題 9.

成績の評価方法は、
キャラクタが落下itemに触った際に 1 点ずつ加算
する方式で、スコア機能を実装して下さい。

[回答](./answer/q2-9.rb)
[解説ビデオ](https://drive.google.com/file/d/1w7jkarxglxYIVrh6NBgKUU9ih_tofqdy/view?usp=sharing)


スコアを表示する為には数値を文字列に変換する必要があります。

```ruby
test = 0
test.to_s
```

このプログラムの様に ``.to_s`` は変換したい数値の後ろに付ける事で
文字列に変換できます。

### ゲームとしての仕上げ

ここまで来ると本当にゲームとしての体裁が整っています。
後 1 つ残念な点を挙げるとすれば、
それはゲームの明確な終わりをプレイヤーに示せない点でしょうか。

ゲームが唐突に始まる事よりも、

ゲームの終りとしての区切りが無い方が不便と思われます。

プログラムの定義にも正しく終了出来る事がある事ですし、
ここはゲーム終了させるタイミングを作成したいと思います。

まず、現在このゲームではitemを取れない場合、
画面の外に出て返ってこない仕様です。
その為、次のitemが出て来る事を永遠に待つ事になります。
これが問題です。

なので、この問題点を解消し、
落下ブロックが下のブロックに触れた段階で終了にします。

終了する為の条件式は、
今迄やって来た中で理解出来ると思いますが、
終了する為の具体的な方法が現状では分かりません。

DXRuby では、
ゲームを終了するには ``Window.loop`` を ``break``
すると終了出来ます。
但し、唐突に終了します。
何もメッセージを出さずウィンドウが消える為
プレイヤーには何が起ったのか理解出来ない可能性があります。

#### 問題 10.

そこで、itemを落とした際に、
Game Over の様なメッセージと、
スコアがどれ位であったかを示し、
何かボタンを押した時に終了する様にして貰います。
ゲームが終了した瞬間の画面は表示したままにして下さい。
条件分岐を上手く使用する事で解決出来ます。

[回答](./answer/q2-10.rb)
[解説ビデオ](https://drive.google.com/file/d/1j_-xTUda_L73u5x90HMyrLmJWYwlCODI/view?usp=sharing)

以下ヒント。
画面に画像や文字を表示するのに使用しているメソッドは、
毎回のループの中で画面を更新しています。
その為、描画する宣言をしていない部分に関しては、
他の画像やフォントを描画する事で消えます。
逆に言えば、
そのまま画面を残したい場合は画面が更新出来なくなれば良いという事です。

この様に、表示したいパーツだけを宣言するテクニックも
ゲームの中では重要になります。

さらにヒント：
例えば、gameoverという変数を用意します。最初は値を0にしておきます。
ブロックに当たったら、gameoverをカウントするようにして、ifでgameover
が1以上であれば、ゲームを終了できるように実装します。
```ruby
if アイテム === ブロック
  gameover += 1
end
if gameover >= 1
  ゲームオーバーと表示する処理
  if Input.keyDown?(キー)
    break                 #キーを押したらloopを抜けて終了
  end
end
```

