# coding: utf-8
require 'dxruby'
x = 0
y = 0

image = Image.load_tiles("./character.png", 4, 4)
sample_sprite = Sprite.new(x, y, image[0])

image_box = Image.load_tiles("./image/colorbox.png", 6, 1)
box = Sprite.new(400, 200, image_box[0])



Window.loop do
    
    if Input.keyDown?(K_RIGHT)
      sample_sprite.x += 2
      if sample_sprite === box
        sample_sprite.x -= 2
      end
    end

    if Input.keyDown?(K_LEFT)
        sample_sprite.x -= 2
        if sample_sprite === box
            sample_sprite.x += 2
        end
    end
    
    if Input.keyDown?(K_DOWN)
        sample_sprite.y += 2
        if sample_sprite === box
            sample_sprite.y -= 2
        end
    end

    if Input.keyDown?(K_UP)
        sample_sprite.y -= 2
        if sample_sprite === box
            sample_sprite.y += 2
        end
    end
  
    # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
    Sprite.draw(sample_sprite)
    Sprite.draw(box)
  end
