第一週目
========


## DXRuby について

ゲームを作成するには様々なツール (道具) があります。
その中でも比較的に利用が簡単な物として、
DXRuby という物を選んでいます。

DXRuby はインストールを行なわなくとも、
フォルダを Windows PC に置くだけで使えるようになります。
但し、Direct X がインストールされている必要はあります。

また、をインストールせずに使用する場合は、
DXRuby をまとめているフォルダに、
画像や作成したプログラムを入れておくようにして下さい。

これからその使い方について解説を行なっていきます。

### DXRubyの導入
下記リンクをクリックして、zipファイルをダウンロードしてください。

[ダウンロード](https://drive.google.com/file/d/1i7Nu0gScv-OeGfmYT1Vt8JwmVYMRWseM/view?usp=sharing)

### エディタの導入
プログラムを編集するためのツールであるVisual Studio Codeをインストールしてください。
[公式サイト](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)


### Window の作成

Window を作成するだけであれば、
DXRuby では下記の様に書く事で実現出来ます。
```ruby
# coding: utf-8
require 'dxruby'

Window.loop do

end
```

ただし、上記プログラムのみではウィンドウを表示するだけで、
ゲームとしては成り立ちません。
このプログラムに少しずつ形を与える事で
ゲームに近づいていきます。

``require 'dxruby'`` という行は、
DXRuby を実行する為に必要な記述です。

### 画像データの読み込み方と表示

ゲームに使用するキャラクター (画像) の読み込み方法を示します。
```ruby
# 一つのファイルに一つの画像しか無いときに使う
# "filepath" には文字列でファイルの名前の保存されているフォルダの名前とファイルの名前を記述する
image = Image.load("filepath")

# 一つのファイルに全てのサイズが同じである複数の画像がある場合に使う
# xcount には画像ファイルの中に何個の画像が横並びになっているかを記述する
# ycount は xcount の縦版を記述する
image_array = Image.load_tiles("filepath", xcount, ycount)
```

この時点では、
画像を読み込み、変数にて保持しているだけなので表示はされません。
実際に画像を表示する為には、その為の命令を Window.loop do ... end
の中に記述する必要があります。

絶対パス・相対パスについての説明を以下に図で示します。

![1_1](https://user-images.githubusercontent.com/19345982/33853700-34cad1be-df02-11e7-92ff-35911b84e23d.png)

![1_2](https://user-images.githubusercontent.com/19345982/33853146-49a4df0a-df00-11e7-95cf-19c59f26fff6.png)

![1_1](https://user-images.githubusercontent.com/19345982/33853070-003c3d68-df00-11e7-83d9-12c89043b594.png)

![1_2](https://user-images.githubusercontent.com/19345982/33853098-166ba736-df00-11e7-9b8c-066de689f001.png)

### 画像データをゲーム上で扱いやすくする為に

DXRuby では、画像データを読み込んだままの状態ではゲーム上で
(ゲーム作成の都合上) 扱いにくいため、
今回は、面倒くさい処理を裏方に任せるメソッドを使うことにします。

タイル上の画像を読み込む場合
```ruby
# coding: utf-8
require 'dxruby'
x = 0
y = 0

image = Image.load_tiles("../character.png", 4, 4)

# Sprite.new とはゲーム上でキャラクタを扱う為に使用するメソッドで、
# このメソッドによって作られたデータを使うことで、
# キャラクタの位置の変更や衝突の判定を簡単に行うことが出来る
sample_sprite = Sprite.new(x, y, image[0])

Window.loop do
  # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
  Sprite.draw(sample_sprite)
end
```

1 枚の画像を表示する場合
```ruby
# coding: utf-8
require 'dxruby'
x = 0
y = 0

image = Image.load("../character.png")
sample_sprite = Sprite.new(x, y, image)

Window.loop do
  Sprite.draw(sample_sprite)
end
```

画像データを扱う場合に image という名前の変数を使う人が多いですが、
image では何の画像か分かり辛いので、
画像データの中身に合わせた変数名にすると良いです。
何らかのキャラクタの画像ならば、
そのキャラクタの名前を変数名に使うなどが、例として考えられます。
サンプルでは、どの様な物として扱うのかを分かり易くする為に、
一般的な名前を使用しています。

※ 写真の分割について以下に図で説明します。

![_ 1_1](https://user-images.githubusercontent.com/19345982/33780700-06fee280-dc95-11e7-94c6-eb370aadae3a.jpg)

![_ 1_2](https://user-images.githubusercontent.com/19345982/33780720-170ed072-dc95-11e7-9fa3-31ddf38331de.jpg)

　image = Image.load_tiles("../character.png", 数字1,数字2)の数字1、数字2のの部分をいろいろかえてみましょう。
 
![_ 1_3](https://user-images.githubusercontent.com/19345982/33780729-23908c32-dc95-11e7-89e4-930e1e5a06dd.jpg)

![_ 1_4](https://user-images.githubusercontent.com/19345982/33780767-4a6cf73c-dc95-11e7-89d7-236b3c8bfd0d.jpg)

※　loopで写真を描くと、静止画はもちろん、工夫すれば、アニメーションが出来ます。コマ送りのイメージです。
![_ 1](https://user-images.githubusercontent.com/19345982/33782010-341d13c2-dc9a-11e7-8c10-78fef56127ed.png)
![_ 1](https://user-images.githubusercontent.com/19345982/33782036-58fd6fca-dc9a-11e7-90c1-f7a978681a33.png)

### Sprite データの処理 (画像データの画面内移動)

Sprite データは x, y という二つの座標データを持っています。
このデータは Sprite.new を実行した際に登録した二つの座標です。
そして、画像が表示されている場所は Sprite データが持っている座標に従っています。

ゲームで扱う座標は、
数学とは違い原点である 0 は画面の一番左上となっているので、
間違い易い為気を付けましょう。
左から右に X 軸がプラス方向、上から下に Y 軸がプラス方向となっています。
この時 Y 軸の扱いが数学のグラフとは逆になっている為注意が必要です。

Sprite データの x, y 座標は Sprite データの変数名に、
それぞれ ``.x`` ``.y`` をつけることで扱う事ができます。
この座標に対して計算を行ない、
座標を少しずつずらしていく事で、
パラパラ漫画のように Sprite を移動させることが出来ます。
ゲームのキャラクタ等の移動はこの様な方法を使って実現しています。

```ruby
Window.loop do
  # sample_sprite という Sprite データの x 座標をプラス 1 する
  # += という記号の組み合わせは、左辺の値に右辺の値をプラスし、代入する意味を持つ
  # 他にも、-=, *=, /= などもある
  # += 1 の場合だと左辺の変数の値が 1 ずつ増加していく
  sample_sprite.x += 1

  # y も 1 ずつ増加
  sample_sprite.y += 1

  # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
  Sprite.draw(sample_sprite)
end
```

上記の様なプログラムを書いて、
実際に表示させた Sprite を移動させて見て下さい。
sample_sprite の増加値を変えると移動速度が変わる事も確認して下さい。

#### 問題 1.

先程のプログラムでは sprite は画面の右に向かって進んでいますが、
別途、画面の左に向って移動するプログラムを作成して下さい。
この時、時間の経過によって画面の外に出て返ってこない状態になる事を
正常な動作とします。

#### 問題 2.

問題 1 で作成したプログラムで、
sprite が画面の左端から外に出ない様にして下さい。
画面の左端は X 軸の 0 です。

ヒント：
if文を使います。

さらにヒント：
sample_sprite.x-=1するときのif文の条件を考えましょう。

さらにヒント：
上記の例だと、if文でsample_sprite.xが0より左に進まないようにするには？

ここで注意：if文で、sample_sprite.x > 0を条件としています。
もし、sample_sprite.x >= 0を条件とするとsample_sprite.x -= 1はどういう値になるでしょうか？
sample_sprite.xは-1になってしまいます。if文の条件に注意しましょう。

## DXRuby でゲーム作成

ここからは、いよいよゲームの制作に入って行きます。
不明な点が出てきた場合は過去の話に戻って、
良く理解してから進めて下さい。

### キャラクタの操作

キャラクタの操作を行うために、
キーボード入力の受け付けを行なう必要が出てきます。

DXRuby では、キーボード、マウス、
ゲームパッドのそれぞれのアクション
(要するにボタンを押したりする行為) を受け付けています。
その為、ユーザーからの入力は簡単に扱えます。
そして、この機能を使ってキャラクタの移動の機能を実装します。

今回はキャラクタの移動については、
キーボードの入力を受け付ける形にします。
キーボード入力の受け付けは、
``Input.keyDown?`` というメソッドを使用する事で出来ます。
メソッドの () 内で指定したキーの入力
(押し続けを含む) を判定し、指定したキーを押していれば true
という、"真" をあらわす値が返されます。
指定したキーが押されていなければ false
という "偽" をあらわす値が返されます。

このメソッドだけでは押しているのかどうかが分かるだけで、
処理がゲームに反映されない
(特定のボタンを押した時にキャラクタが移動しない) ため、
条件分岐を使います。

キーボードの特定のキーを押すと
キャラクタが移動するという機能が欲しい場合、
キーを押していると移動する、
何も押していない場合は動かない、といった処理にする必要があります。

下記の様な記述を行なう事で、入力に対して動作を割りあてる事が出来ます。
```ruby
Window.loop do
  # K_L と言うのは、キーボードの L キーという意味
  # つまりキーボードの L のキーを押して (押し続けて) いたら true (真) である
  # true が返ってくると、if `条件式` ~ end の間に書いた処理が実行される
  # この場合は sample_sprite.x += 1 が実行される
  # 因みに、移動速度を変更したい場合は数値を変更すると良い
  if Input.keyDown?(K_L)
    sample_sprite.x += 1
  end

  # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
  Sprite.draw(sample_sprite)
end
```

使いたいキーのコードを調べたい場合、
[DXRuby キーコードリファレンス](http://mirichi.github.io/dxruby-doc/api/constant_keycode.html)
を参照して下さい。

#### 問題 3.

矢印キーを使って、
上下左右に移動出来る様にプログラムを作成して下さい。

ヒント：

```ruby
  if Input.keyDown?(キー)
   ここに入れるコードは以下参照
  end
```

■ 右に進む場合
 sample_sprite.x += 1

■ 左に進む場合
 sample_sprite.x -= 1

■ 上に進む場合
 sample_sprite.y -= 1

■ 下に進む場合
 sample_sprite.y += 1
 
![_ 1](https://user-images.githubusercontent.com/19345982/33780879-b78291a6-dc95-11e7-9370-cb963d267ae9.png)

### 衝突判定

衝突判定とは、
オブジェクトとオブジェクトが衝突を起こしていることを判定する事です。
衝突判定に穴があると、
キャラクタが重なったり、壁のすり抜け等のバグに繋ります。

本来、衝突判定は非常に面倒くさい処理を必要としますが
(数学で、行列やベクトル等が必須)、
簡単に判定できる仕組みがありますのでそちらを使用します。

まず、当たり前ですが、衝突には二つ以上のオブジェクトが必要ですので、
Sprite データとして ２ つの画像 (オブジェクト) を用意します。
簡単に判定を行うには Sprite データとして扱わないと行けないので、
必ず Sprite データとして画像を用意して下さい。

衝突判定を行なうには、``===`` という比較を使用します。
``==`` と間違えない様に注意して下さい。
``===`` を挟んだ、
左辺のオブジェクトと右辺のオブジェクトが
重なっている場合に true を返します。
重なっていない場合は false を返します。

サンプルコードを実行して衝突する事と確認して下さい。
```ruby
image = Image.load_tiles("../character.png", 4, 4)
sample_sprite = Sprite.new(200, 200, image[0])

image_box = Image.load_tiles("../image/colorbox.png", 6, 1)
box = Sprite.new(400, 200, image_box[0])

Window.loop do
  if Input.keyDown?(K_L)
    sample_sprite.x += 1
    # === を使って左辺と右辺を比較する事で衝突の判定をとることが出来る
    # この時両方のデータは Sprite データを持った変数か、配列であること
    # それ以外ではエラーとなる
    # 衝突が行われた場合は true が返ってくるため、この場合、
    # 直前にキャラクタの座標を x+1 しているため、その時に衝突した場合は
    # x+2 の処理を取りやめている
    # 結果的に、キャラクタは移動せずに壁にぶつかって止まっているように見える
    if sample_sprite === box
      sample_sprite.x -= 1
    end
  end

  # 画面の更新を行っている
  # この処理が実行されるまでは、オブジェクトにどれだけ変化が起こっていても
  # 見た目には反映されない
  Sprite.draw(sample_sprite)
  Sprite.draw(box)
end
```

衝突のイメージ

![1](https://user-images.githubusercontent.com/19345982/33853884-ef65fe86-df02-11e7-8248-e7d9f1db4c28.png)

#### 問題 4.

上記プログラムでは衝突の判定は box に対して右にのみ存在しています。
その為、
キャラクタが箱に当たった時に移動しないという操作は右からのみ有効です。
これを、全ての方向から判定を行ない、すり抜けが発生しない様にして下さい。
