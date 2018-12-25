# coding: utf-8

# 画像を放り込むだけで背景スクロールができるクラス

require 'dxruby'

class Background
  def initialize(image=nil)
    asp_x = Window.width / image.width + 1
    if Window.width % image.width != 0
      asp_x += 1 
    end
    asp_y = Window.height / image.height + 1
    if Window.height % image.height != 0
      asp_y += 1
    end 
    @object = []
    (-1..asp_y).to_a.map do |y|
      (-1..asp_x).to_a.map do |x|
        @object << Sprite.new(x * image.width, y * image.height, image)
      end
    end
  end

  def scroll(x=0, y=0)
    @object.map! do |o|
      o.x += x
      if o.x < - o.image.width
        o.x += Window.width + o.image.width * 2
      elsif o.x >= Window.width + o.image.width
        o.x -= Window.width + o.image.width * 2
      end
      o.y += y
      if o.y < - o.image.height
        o.y += Window.height + o.image.height * 2
      elsif o.y >= Window.height + o.image.height
        o.y -= Window.height + o.image.height * 2
      end
      o
    end
  end

  def draw
    Sprite.draw @object
  end
end

# 使い方 Background.new(image)
image = Image.load("images/background.png")
bg = Background.new(image)

Window.loop do
  # スクロール (x, y)
  bg.scroll(-10, 8)

  # これで出力される
  # Sprite.draw に含めないでください。
  bg.draw

  break if Input.key_push?(K_RETURN)
end
