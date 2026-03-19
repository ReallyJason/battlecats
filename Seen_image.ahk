#Requires AutoHotkey v2.0

F2:: {
    if !FileExist(".\images\Buffet.PNG") {
        MsgBox("Error: The image file was not found at .\images\Buffet.PNG")
        return
    }

    CoordMode("Pixel", "Client")
    if ImageSearch(&foundX, &foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*90 .\images\Buffet.PNG") {
        ; Move mouse to where it found it so you can verify
        MouseMove(foundX, foundY)
        MsgBox("Found it! Coordinates: " foundX ", " foundY)
    } else {
        MsgBox("Image not seen. Try increasing the *50 to *70 or retaking the screenshot.")
    }
}