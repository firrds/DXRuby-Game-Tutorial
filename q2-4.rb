Window.width = 360
Window.height = 480

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)

block_x = 0
block_y = 460
item_x = 50
item_y = 0
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

item = Sprite.new(item_x, item_y, image_box[0])

Window.loop do
    item.y += 1 
    if item === blocks
        item.y -= 1
    end
    Sprite.draw(item)
    Sprite.draw(blocks)
end