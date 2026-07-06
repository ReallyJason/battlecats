; --- Position and Color Finder Tool (v2) ---
; Press F3 to start/stop.

F3:: {
    static ToggleFinder := false
    ToggleFinder := !ToggleFinder
    
    if (ToggleFinder) {
        SetTimer(UpdateFinder, 50) ; Function call uses ()
    } else {
        SetTimer(UpdateFinder, 0)  ; 0 turns the timer off in v2
        ToolTip()                  ; Empty ToolTip() clears it
    }
}

UpdateFinder() {
    ; v2 uses & to "output" variables and coordinates are relative to active window by default
    MouseGetPos(&x, &y)
    
    ; PixelGetColor is now a function that returns the value
    color := PixelGetColor(x, y)
    
    ; Display info - v2 uses "quotes" for strings and no percent signs for variables here
    ToolTip("X: " x "  Y: " y "`nColor: " color "`nPress F3 to Stop", x + 20, y + 20)
}