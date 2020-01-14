# coding: utf-8
require 'dxruby'

Window.width = 360
Window.height = 480

image_chara = Image.load_tiles("../character.png", 4, 4)
chara = Sprite.new(200, 400, image_chara[0])

images = Image.load_tiles("../image/colorbox.png", 6, 1)

font16 = Font.new(16)

block_x = 0
block_y = 460
blocks = []
count = 0

loop do
  blocks[count] = Sprite.new(block_x, block_y, images[5])
  if 340 < block_x
    break
  end
  count = count + 1
  block_x = block_x + 20
end



jumpflag = false
y_temp = 0
y_prev = 0
y = 0
jump_chara_y = 0

Window.loop do
  #yの値
  #[0,-10,-19, -27, -34, -40, -45, -49, -52, -54, -55, -55, -54, -52, -49, -45, -40, -34, -27, -19, -10, 0]
  #上の数列の公差
  #[ 10   9   8    7    6    5    4    3    2    1    0    1    2    3    4    5    6    7    8    9    10]
  if jumpflag == true
    #前のyの値といまのyの値の差をもとめ　1だけ縮める（縮めないと上にあがり続けるから）
    #これが公差になります
    y_temp = y;
    y += (y-y_prev)+1;
    y_prev = y_temp;

    chara.y = jump_chara_y + y
    if y == 0 
      jumpflag=false;
      y_temp = 0
      y_prev = 0
    end
  end
 
  if chara === blocks and Input.key_push?(K_SPACE) and jumpflag == false
    jumpflag=true;
    #ジャンプしたときのキャラのy座標を保存
    jump_chara_y = chara.y
    y_prev=y;
    y-=10;
  end

  
  if (chara === blocks) == false and jumpflag == false
    chara.y += 2
  end

  if Input.keyDown?(K_LEFT)
    chara.x -= 2
  end

  if Input.keyDown?(K_RIGHT)
    chara.x += 2
  end

  Sprite.draw([chara, blocks])
  Window.draw_font(150, 80, "y_tempの値:#{y_temp}", font16)
  Window.draw_font(150, 100, "y_prevの値:#{y_prev}", font16)
  Window.draw_font(150, 120, "yの値:#{y}", font16)
  Window.draw_font(150, 140, "chara.yの値:#{chara.y}", font16)
  Window.draw_font(150, 180, "jumpflagの値:#{jumpflag}", font16)
    

end