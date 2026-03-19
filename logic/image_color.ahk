#Requires AutoHotkey v2.0

; In v2, PixelSearch returns true/false. Use &var for coordinates.
yesbutton() => PixelSearch(&gx, &gy, 796, 609, 1036, 717, 0xFFC423, 0)
startbuttoncolor() => PixelSearch(&gx, &gy, 347, 304, 535, 391, 0xF7BB00, 0)
izumisumm() => PixelSearch(&gx, &gy, 1184, 839, 1356, 957, 0xFCF8F0, 0)
phonoasumm() => PixelSearch(&gx, &gy, 1369, 841, 1536, 956, 0xFBF8F2, 0)
itemReward() => PixelSearch(&gx, &gy, 903, 754, 991, 784, 0xFFFF00, 0)
buhmreadyforsum() => PixelSearch(&gx, &gy, 1013, 838, 1174, 900, 0xD89600, 0)
YellowPause() => PixelSearch(&gx, &gy, 327, 102, 406, 168, 0xFFCC00, 0)
LuckyCapsuleColor() => PixelSearch(&gx, &gy, 806, 241, 832, 255, 0xF19D2F, 0)

redOnSelect() {
    global Movex, Movey
    if PixelSearch(&gx, &gy, 590, 196, 630, 730, 0xFF5700, 0) {
        Movex := gx
        Movey := gy
        return true
    }
    return false
}

redFlag() {
    return PixelSearch(&gx, &gy, 700, 370, 800, 450, 0x36362E, 0) 
        || PixelSearch(&gx, &gy, 700, 370, 800, 450, 0xD34032, 0)
}

CatFruitBuffet() {
    CoordMode("Pixel", "Screen") 
    Sleep(1000)

    if ImageSearch(&gx, &gy, 0, 0, A_ScreenWidth, A_ScreenHeight, "*90 .\logic\images\Buffet.PNG") {
        MouseMove(gx, gy)
        return true
    } else {
        return false
    }
}

GrowingCatfruit() {
    CoordMode("Pixel", "Screen") 
    Sleep(1000)

    if ImageSearch(&gx, &gy, 0, 0, A_ScreenWidth, A_ScreenHeight, "*90 .\logic\images\growing_catfruit.PNG") {
        MouseMove(gx, gy)
        return true
    } else {
        return false
    }
}