b = {
    x = 64,
    y = 64,
    s = ball_size,
    x_spd = 0,
    y_spd = 0,
    t = 60
}

function is_ball_moving()
    return b.x_spd == 0 and b.y_spd == 0
end

function init_ball()
    if rnd(10) % 2 == 0 then
        b.x_spd = ball_speed_init
    else
        b.x_spd = -ball_speed_init
    end
    if rnd(10) % 2 == 0 then
        b.y_spd = ball_speed_init
    else
        b.y_spd = -ball_speed_init
    end
end

function who_will_ball_touch()
    if b.x_spd > 0 then
        if b.x + b.x_spd > 127 - e.w and b.y > e.y and b.y < e.y + e.h then
            return "enemy"
        end
        return nil
    else
        if b.x + b.x_spd < p.w and b.y > p.y and b.y < p.y + p.h then
            return "player"
        end
        return nil
    end
end

function move_ball()
    touched = who_will_ball_touch()

    if touched == "player" then
        b.x = p.w
        b.y = (b.y_spd * (p.w - b.x) + b.y * b.x_spd) / b.x_spd
        b.x_spd = abs(b.x_spd) + ball_speed_inc
        sfx(0)
    elseif touched == "enemy" then
        b.x = 127 - p.w
        b.y = (b.y_spd * (127 - p.w - b.x) + b.y * b.x_spd) / b.x_spd
        b.x_spd = -b.x_spd - ball_speed_inc
        sfx(0)
    end

    if b.y - b.s / 2 <= 0 or b.y + b.s / 2 >= 127 then
        b.y_spd = -b.y_spd
        sfx(1)
    end

    if touched == nil then
        b.x = b.x + b.x_spd
        b.y = b.y + b.y_spd
    end
end

function reset_ball()
    sfx(2)
    b = {
        x = 64,
        y = 64,
        s = ball_size,
        x_spd = 0,
        y_spd = 0,
        t = 60
    }
end

function ball_score()
    if b.x < 0 then
        e.scr = e.scr + 1
        reset_ball()
    elseif b.x > 128 then
        p.scr = p.scr + 1
        reset_ball()
    end
end

function update_ball()
    if b.t > 0 then
        b.t = b.t - 1
    else
        if is_ball_moving() then
            init_ball()
        end
        ball_score()
        move_ball()
    end
end

function draw_ball()
    rectfill(b.x - b.s / 2, b.y - b.s / 2, b.x + b.s / 2, b.y + b.s / 2, 7)
end
