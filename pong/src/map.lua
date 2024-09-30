o = map_lines_offset

function draw_map()
    is_drawing = true
    for i = 0, 128, 128 / map_lines do
        if is_drawing then
            line(64, i + o, 64, i + 128 / map_lines + o, 7)
        end
        is_drawing = not is_drawing
    end
    rect(0, 0, 127, 127, 6)
    print(p.scr, 32, 120, 7)
    print(e.scr, 96, 120, 7)
end
