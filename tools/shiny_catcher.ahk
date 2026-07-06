#Requires AutoHotkey v2.0

global seen := false

F1::SetTimer(CheckShiny, 500)
F5::SetTimer(CheckShiny, 0)

CheckShiny() {
    global seen

    if shiny_color_left() {
        if !seen {
            Send("c")
            seen := true
        }
    } else {
        seen := false
    }
}

shiny_color_left() {
    return PixelSearch(&gx, &gy, 0, 1000, 200, 900, 0xFF8417, 0)
}