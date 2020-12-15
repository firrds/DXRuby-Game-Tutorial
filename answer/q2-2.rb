# coding: utf-8
require 'dxruby'

Window.width = 300
Window.height = 300
block_x = 0
block_y = 0
count = 0
sprites = []

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)

loop do
  sprites[count] = Sprite.new(block_x, block_y, image_box[5])
  if 280 < block_x
    break
  end
  block_x = block_x + 20
  count = count + 1
end

loop do
    sprites[count] = Sprite.new(block_x-20, block_y, image_box[5])
    if 280 < block_y
      break
    end
    block_y = block_y + 20
    count = count + 1
end

loop do
    sprites[count] = Sprite.new(block_x, block_y-20, image_box[5])
    if 0 > block_x
      break
    end
    block_x = block_x - 20
    count = count + 1
end

loop do
    sprites[count] = Sprite.new(block_x+20, block_y, image_box[5])
    if 0 > block_y
      break
    end
    block_y = block_y - 20
    count = count + 1
end

Window.loop do
  Sprite.draw(sprites)
end
