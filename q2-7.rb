Window.width = 360
Window.height = 480

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)

block_x = 0
block_y = 460
item_x = 50
item_y = 0
blocks = []
count = 0

image = Image.load_tiles("./character.png", 4, 4)
sample_sprite = Sprite.new(60, 60, image[0])

item = Sprite.new(item_x, item_y, image_box[0])

loop do
  blocks[count] = Sprite.new(block_x, block_y, image_box[5])
  if 340 <= block_x
    break
  end
  count = count + 1
  block_x = block_x + 20
end



Window.loop do
    sample_sprite.y += 1
    
    if item === blocks
        item.y -= 1
    end

    if sample_sprite === blocks
        sample_sprite.y -= 1
    end
    
    if Input.keyDown?(K_RIGHT)
        sample_sprite.x += 2
    end
  
    if Input.keyDown?(K_LEFT)
        sample_sprite.x -= 2
    end

    if Input.keyDown?(K_DOWN)
        sample_sprite.y += 2
    end
  
    if Input.keyDown?(K_UP)
        sample_sprite.y -= 2
    end
    if item === sample_sprite
        item = nil
    end

    if item.nil? == false
        item.y += 1
        Sprite.draw(item)
    end

    if item.nil? == true
        item = Sprite.new(item_x, item_y, image_box[0])
    end

    Sprite.draw(blocks)
    Sprite.draw(sample_sprite)
end