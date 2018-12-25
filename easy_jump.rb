# coding: utf-8
=begin
  ＜課題 20＞
  操作キャラクターがジャンプ出来る機能を付けて下さい。
  一度ボタンを押すと特定の高さまで上昇し、元々の機能により、落下する機能です。
  ジャンプ中には再度ジャンプは出来ないようにして下さい。
  高さは自由に設定して下さい。

  ＜補足＞
  一度ボタンを押すと二次曲線を描くように上昇・下降するようにした。
  元々の機能によって落下は行わない。
=end

require 'dxruby'

Window.width = 360
Window.height = 480

image_chara = Image.load_tiles("./images/character.png", 4, 4)
chara = Sprite.new(200, 200, image_chara[0])

images = Image.load_tiles("./images/colorbox.png", 6, 1)

block_x = 0
block_y = 460
blocks = []
count = 0

loop do
  blocks[count] = Sprite.new(block_x, block_y, images[5])
  if 340 < block_x
    break
  end
  count = count + 1
  block_x = block_x + 20
end

jumping  = false
jump_y   = 34
jump_cnt = jump_y + 1

Window.loop do
  if (chara === blocks) == false and jumping == false
    chara.y += 2
  end

  if Input.keyDown?(K_LEFT)
    chara.x -= 2
  end

  if Input.keyDown?(K_RIGHT)
    chara.x += 2
  end

  if chara === blocks and Input.key_push?(K_UP) and jumping == false
    jump_cnt = - jump_y
  end

  if jump_cnt <= jump_y
    jumping = true
    y = (jump_cnt ** 2) / (jump_y * 2)
    if jump_cnt < 0
      y *= -1
    end
    chara.y += y
    jump_cnt += 2
  else
    jumping = false
  end

  Sprite.draw([chara, blocks])
end
