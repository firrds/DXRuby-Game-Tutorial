第三週目  追加課題
========

ゲーム制作に必要な部分を補うという意味でよく使用されることを問題として追加する。

### 追加問題 1.

#### マップの作成

```ruby
# coding: utf-8
require 'dxruby'

map = [1, 1, 1, 0, 0, 0, 1, 1, 1, 2, 2, 2, 1, 1, 1]


# 座標初期位置
blocks = Array.new

tile_image = Image.load_tiles('../image/colorbox.png',6,1)

# tile_image[num]をスプライト形式にして、block に追加していく
# numには map配列の要素(数字)が入る。　課題１１と課題２１を参考に。

## 配列の要素の数だけ繰り返す　という処理は　each でした。（復習）
## 要素番号も使いたい場合は each_with_index をつかえば可能です（リファレンス自力理解してもらう）


Window.loop do
  Sprite.draw(blocks)
end
```

### 追加問題 2.

#### 複数行マップの作成

```ruby
# coding: utf-8
require 'dxruby'

map = [
  [1, 1, 1, 3, 3, 3, 1, 1, 1, 2, 2, 1, 1, 1],
  [1, 1, 1, 1, 1, 3, 1, 1, 1, 2, 2, 1, 1, 1],
  [1, 1, 1, 1, 1, 3, 1, 1, 1, 2, 2, 1, 1, 1]
]

# 座標初期位置
blocks = Array.new

tile_image = Image.load_tiles('../image/colorbox.png',6,1)

#二重ループ each_with_index の中で、 each_with_index を使う
#１つ目のループは、mapの行を繰り返していく。（１行目が処理し終わったら２行目の処理を開始させる）
#２つ目のループは、行の中の各要素を繰り返していく（つまり前の課題と同じ）

Window.loop do
  Sprite.draw(blocks)
end

```
### 追加問題 3.

#### ゲームシーンの切り替え

ゲームを起動すると、画面でゲーム開始の画面が表示される、そして、指定したキーを押すと、画面が変わってゲームを始まるように開始画面を付けてください。
ヒント：フラグとなる変数を追加してください。フラグの値を判定することでシーンを切り替える。

```ruby

flag = "start"

Window.loop do
if flag == "start"
  Window.draw_font(600,300,a,font)
  Window.draw_font(600,350,"Game START",font)
  Window.draw_font(600,400,"Push Button s to start the game",font)
  if Input.keyDown?(K_s)
    a = "begin"
  end
# ほかのフラグの状態の処理はその続きで書く


end
```
### 追加問題 4.

#### 弾の発射

```ruby
# coding: utf-8
require 'dxruby'

image_chara = Image.load_tiles("../character.png",4,4)
chara = Sprite.new(150, 300, image_chara[0])

image_box = Image.load_tiles("../image/colorbox.png", 6, 1)
box = Sprite.new(0,-10,image_box[0])
tama = 0

Window.loop do

        if Input.key_push?(K_SPACE) #Dキー 押したらキャラのy座標に +1
            if tama == 0
                box = Sprite.new(chara.x,chara.y,image_box[0])
            end
        tama += 1
        end

        if box.y < 0
            tama = 0
        end

    Sprite.draw(chara)
    Sprite.draw(box)

end
```
