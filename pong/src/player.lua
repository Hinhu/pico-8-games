p = {
    x = 0,
    y = 64 - player_heigth / 2,
    w = player_width,
    h = player_heigth,
    spd = player_speed,
    scr = 0
}

function update_player()
    if btn(2) and p.y > 0 then
        p.y = p.y - p.spd
    end
    if btn(3) and p.y + p.h < 127 then
        p.y = p.y + p.spd
    end
end

function draw_player()
    rectfill(p.x, p.y, p.x + p.w, p.y + p.h, 7)
end
