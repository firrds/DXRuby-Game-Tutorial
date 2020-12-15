# coding: utf-8
require 'dxruby'

Window.width = 360
Window.height = 480

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)
image = Image.load_tiles("./character.png", 4, 4)

block_x = 0
block_y = 460
chara_x = 50
chara_y = 200
item_x = 100
item_y = 80
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
item = Sprite.new(item_x, item_y, image_box[0])

Window.loop do
   
    if item === blocks
        item.y -= 1
    end
    
    if Input.keyDown?(K_RIGHT)
        chara.x += 2
    end
  
    if Input.keyDown?(K_LEFT)
        chara.x -= 2
    end

    if Input.keyDown?(K_DOWN)
        chara.y += 2
        if chara === blocks
            chara.y -= 2
        end
    end
  
    if Input.keyDown?(K_UP)
        chara.y -= 2
    end

    if item === chara
        item = nil
    end

    if item.nil? == true
        item = Sprite.new(item_x, item_y, image_box[0])
    end

    if item.nil? == false
        item.y += 1
        Sprite.draw(item)
    end


    Sprite.draw(blocks)
    Sprite.draw(chara)
end
