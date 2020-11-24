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
item_x = 130
item_y = 0
blocks = []
count = 0
item_count = 0
gameover = 0

font = Font.new(32)

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
        gameover += 1
    end
    if gameover >= 1
        Window.draw_font(100, 100, "Game Over!", font)
        if Input.keyDown?(K_Q)
            break
        end
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
        item_count += 1
    end

    if item.nil? == true
        x = rand(340)
        item = Sprite.new(x, item_y, image_box[0])
    end

    if item.nil? == false
        item.y += 1
        Sprite.draw(item)
    end


    Sprite.draw(blocks)
    Sprite.draw(chara)
    Window.draw_font(10, 10, item_count.to_s, font)
end
