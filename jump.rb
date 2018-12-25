# coding: utf-8

# ジャンプ＋重力処理

require 'dxruby'

# require image
chara_image = Image.load_tiles('images/character.png', 4, 4)
tile_image  = Image.load_tiles('images/colorbox.png',  6, 1)

# requre tiles
tiles = []
j = 0
tile_width  = tile_image[0].width
tile_height = tile_image[0].height
width_max = 0
height_max = 0
File.open('map.csv') do |file|
  file.each_line do |line|
    temp = 0
    line.chomp.split(",").map.with_index do |data, i|
      if data == "1"
        tiles << Sprite.new(i*tile_width, j*tile_height, tile_image[rand(0..5)])
      end
      temp = i
    end
    j += 1
    width_max = temp if width_max <= temp
  end
end
width_max += 1
height_max = j

# require window size
Window.width, Window.height = tile_width * width_max, tile_height * height_max

# require chara sprite
chara = Sprite.new(200, 50, chara_image[0])

# require move
move = 3

# require fall
g_teisu = 1.5
g_start = -16
g_time  = 0.0
g_limit = 20
g_div   = 4

Window.loop do
  bool_landing = false

  if Input.keyDown?(K_RIGHT)
    chara.x += move
    if chara.x > Window.width - chara.image.width
      chara.x = Window.width - chara.image.width
    end
    if chara === tiles
      chara.x -= move
    end
  end

  if Input.keyDown?(K_LEFT)
    chara.x -= move
    if chara.x < 0
      chara.x = 0 
    end
    if chara === tiles
      chara.x += move
    end
  end

  val_t = g_time.fdiv(g_div)
  val = val_t ** 2 * g_teisu

  8.times do |i|
    print "-"
    if g_time < 0
      chara.y -= val.fdiv(8)
    else
      chara.y += val.fdiv(8)
    end

    if (hits = chara.check(tiles)) != []
      hits.each do |tile|
        if g_time < 0
          chara.y = tile.y + tile.image.height
          break
        end
        if tile.x - chara.image.width < chara.x and chara.x < tile.x + tile.image.width
          g_time = 0
          chara.y = tile.y - chara.image.height
          bool_landing = true
          break
        end
      end
      break
    end
  end
  puts "|"

  if g_time < g_limit
    g_time += 1
  end

  if chara.y > Window.height - chara.image.height
    chara.y = Window.height - chara.image.height
    bool_landing = true
  end

  if Input.keyDown?(K_UP) and bool_landing == true
    g_time = g_start
  end

  Sprite.draw(chara)
  Sprite.draw(tiles)
end