e = {
    x = 127 - player_width,
    y = 64 - player_heigth / 2,
    w = player_width,
    h = player_heigth,
    spd = player_speed,
    scr = 0
}

function update_enemy()
    if b.y + b.s > e.y + e.h then
        e.y = e.y + e.spd
    elseif b.y < e.y then
        e.y = e.y - e.spd
    end
end

function draw_enemy()
    rectfill(e.x, e.y, e.x + e.w, e.y + e.h, 7)
end
