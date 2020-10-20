# coding: utf-8
require 'dxruby'
x = 400
y = 0

image = Image.load_tiles("./character.png", 4, 4)

# Sprite.new とはゲーム上でキャラクタを扱う為に使用するメソッドで、
# このメソッドによって作られたデータを使うことで、
# キャラクタの位置の変更や衝突の判定を簡単に行うことが出来る
sample_sprite = Sprite.new(x, y, image[0])

Window.loop do
    # sample_sprite という Sprite データの x 座標をプラス 1 する
    # += という記号の組み合わせは、左辺の値に右辺の値をプラスし、代入する意味を持つ
    # 他にも、-=, *=, /= などもある
    # += 1 の場合だと左辺の変数の値が 1 ずつ増加していく
    sample_sprite.x -= 1
    # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
    Sprite.draw(sample_sprite)
end