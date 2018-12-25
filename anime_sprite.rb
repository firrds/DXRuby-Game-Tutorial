# coding: utf-8

# Sprite クラスにアニメーションを追加したもの

require 'dxruby'

class AnimeSprite < Sprite
  def initialize(x=0, y=0, image=nil)
    super
    self.image = image[0]
    @stop_animation = false
    @images = image
    @tile_count = 0
  end

  def loop_animation(deley=1)
    @stop_animation = false if @stop_animation
    self.image = @images[ (@tile_count / deley).to_i % @images.length ]
    if @tile_count < @images.length * deley
      @tile_count += 1
    else
      @tile_count = 0
    end
    self
  end

  def finite_animation(count=1, deley=1)
    self.image = @images[ (@tile_count / deley).to_i % @images.length ]
    if @tile_count < @images.length * count * deley - 1
      @stop_animation = false if @stop_animation
      @tile_count += 1
    elsif !@stop_animation
      @stop_animation = true
    end
    self
  end

  def stop_animation?
    @stop_animation
  end
end

exp_img = Image.load_tiles("images/explosion.png", 4, 4)
exp1 = AnimeSprite.new( 10, 10, exp_img) # image を配列で入れる点に注意！
exp2 = AnimeSprite.new(150, 10, exp_img)

font = Font.new(30)

Window.loop do
  # loop_animation(deley) で画像をループさせている
  exp1.loop_animation(2)

  # finite_animation(count, deley) で count の回数分画像をループさせている
  exp2.finite_animation(5, 2)

  # stop_animation? でアニメーションが終了したことを判断できる
  if exp2.stop_animation?
    Window.draw_font(10, 200, "アニメーションが終了しました", font)
  end

  # Sprite.draw は通常通り
  Sprite.draw(exp1)
  Sprite.draw(exp2)

  break if Input.key_push?(K_ESCAPE)
end
