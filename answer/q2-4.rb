# coding: utf-8
require 'dxruby'

Window.width = 360
Window.height = 480

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)
image = Image.load_tiles("./character.png", 4, 4)

block_x = 0
block_y = 460
chara_x = 50
chara_y = 0
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

chara = Sprite.new(chara_x, chara_y, image[0])

Window.loop do
  chara.y += 1 
    if chara === blocks
      chara.y -= 1
    end
    Sprite.draw(chara)
    Sprite.draw(blocks)
end
