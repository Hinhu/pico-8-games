function _init()

end

function _update()
    update_player()
    update_enemy()
    update_ball()
end

function _draw()
    cls()
    draw_player()
    draw_enemy()
    draw_ball()
    draw_map()
end
