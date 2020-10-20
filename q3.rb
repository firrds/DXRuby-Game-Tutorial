# coding: utf-8
require 'dxruby'
Window.width = 500
Window.height = 500
x = 0
y = 0

image = Image.load_tiles("./character.png", 4, 4)
sample_sprite = Sprite.new(x, y, image[0])

Window.loop do
    
    if Input.keyDown?(K_RIGHT)
      sample_sprite.x += 2
      if sample_sprite.x > 470
        sample_sprite.x = 470
    end
    end

    if Input.keyDown?(K_LEFT)
        sample_sprite.x -= 2
        if sample_sprite.x < 0
            sample_sprite.x = 0
        end
    end
    
    if Input.keyDown?(K_DOWN)
        sample_sprite.y += 2
        if sample_sprite.y > 467
            sample_sprite.y = 467
        end
    end

    if Input.keyDown?(K_UP)
        sample_sprite.y -= 2
        if sample_sprite.y < 0
            sample_sprite.y = 0
        end
    end
  
    # Sprite.draw メソッドを使うと指定した Sprite データを画面に表示 (描画) することが出来る
    Sprite.draw(sample_sprite)
  end