#Requires AutoHotkey v2.0
#SingleInstance Force

; --- Global Variables ---
global buttonAction := 0
global Movex := 0
global Movey := 0

; --- GUI Construction ---
MainGui := Gui("+AlwaysOnTop", "Main Screen")
MainGui.OnEvent("Close", (*) => ExitApp())

MainGui.Add("Text",, "Reminder that F1 starts, and F5 stops")

; Map buttons to a helper function that sets the action and hides the GUI
MainGui.Add("Button", "w200", "Lucky ticket -> Icy desire").OnEvent("Click", (*) => SetAction(1))
MainGui.Add("Button", "w200", "Buffet").OnEvent("Click", (*) => SetAction(2))
MainGui.Add("Button", "w200", "Opening Lucky").OnEvent("Click", (*) => SetAction(3))
MainGui.Add("Button", "w200", "nothing").OnEvent("Click", (*) => SetAction(4))
MainGui.Add("Button", "w200", "nothing").OnEvent("Click", (*) => SetAction(5))
MainGui.Add("Button", "w200", "nothing").OnEvent("Click", (*) => SetAction(6))
MainGui.Add("Button", "w200", "Exit").OnEvent("Click", (*) => ExitApp()) ; Action 51/Exit
MainGui.Add("Button", "x150 y106 w50", "Test").OnEvent("Click", (*) => SetAction(7))

MainGui.Show("w350 h400")

SetAction(val) {
    global buttonAction := val
    MainGui.Hide()
}

; --- Hotkeys ---

F1:: {
    global buttonAction
    if (buttonAction == 1)
        icydesire()
    else if (buttonAction == 2)
        BuffetLevel()
    else if (buttonAction == 3)
        opening()
    else if (buttonAction == 7)
        test()
}

F5:: {
    if (buttonAction != 51) {
        upEverything()
        Reload()
    } else {
        ExitApp()
    }
}

; --- Main Loop Functions ---

icydesire() {
    selectLevel(redOnSelect) ; We pass the function object itself now
    Sleep(3000)
    fighticydesire()
    icydesire() 
}

BuffetLevel() {
    selectLevel(CatFruitBuffet)
    Sleep(3000)
    while (!startbuttoncolor()) {
        fightBuffet()
    }
    BuffetLevel()
}

opening() {
    if (!LuckyCapsuleColor())
        Reload()
    
    press4()
    Sleep(10000)
    Loop 20 {
        press4()
        Sleep(500)
    }
    Sleep(1000)
    opening()
}

test() {
    fightBuffet()
    test()
}

; --- Complex Logic Helpers ---

selectLevel(stageFunc) {
    global Movex, Movey
    Sleep(500)
    
    ; Menu navigation
    MouseMove(500, 350)
    Sleep(100)
    clickLeft()
    Sleep(2000)
    MouseMove(937, 688)

    Loop {
        ; Call the passed function (redOnSelect or CatFruitBuffet)
        if stageFunc() {
            Sleep(500)
            clickLeft()
            break
        } else {
            Send("{WheelDown 1}")
            Sleep(2000)
        }
    }
    
    Sleep(2000)
    MouseMove(1600, 700) ; Attack stage
    Sleep(100)
    clickLeft()
    Sleep(1000)
    
    if(true){
    ;if (redFlag()) {
        Sleep(1000)
        MouseMove(907, 667) ; Energy refill "Yes"
        Sleep(1000)
        clickLeft()
        MouseMove(1600, 700)
        Sleep(100)
        clickLeft()
        Sleep(1000)
    }
}

fighticydesire() {
    Loop 5 {
        Sleep(2500)
        slect1() ; summon tank
        if (!YellowPause())
            Reload()
    }
    while (!buhmreadyforsum())
        Sleep(500)
    
    slect3()
    Sleep(1000)
    while (!itemReward() && !yesbutton() && !startbuttoncolor())
        Sleep(500)
    
    MouseMove(857, 877)
    Loop 3 {
        Sleep(500)
        clickLeft()
    }
    if (yesbutton())
        press3()
    Sleep(500)
}

fightBuffet() {
    while (!buhmreadyforsum())
        Sleep(500)
    slect1()
    Sleep(500)
    slect3()
    Sleep(1000)
    while (!izumisumm())
        Sleep(500)
    
    slect4() ; summon izumi
    Sleep(1000)
    slect4() ; ability
    Sleep(2000)
    slect1()
    
    if (!YellowPause())
        Reload()
    
    while (!phonoasumm())
        Sleep(500)
    
    slect5() ; summon phonoa
    Sleep(2000)
    
    while (!itemReward() && !yesbutton() && !startbuttoncolor()) {
        slect1()
        Sleep(500)
        slect2()
        Sleep(500)
        Sleep(1000)
    }

    MouseMove(857, 877)
    Loop 3 {
        Sleep(500)
        clickLeft()
    }
    if (yesbutton())
        sleep(1000)
        mouseMove(950, 650) ; Click "Yes" for reward
        sleep(500)
        clickLeft()
    Sleep(500)
}

; --- Input Helpers (Arrow Functions) ---

press1() => (Send("{1 down}"), Sleep(100), Send("{1 up}"))
press2() => (Send("{2 down}"), Sleep(100), Send("{2 up}"))
press3() => (Send("{3 down}"), Sleep(100), Send("{3 up}"))
press4() => (Send("{4 down}"), Sleep(100), Send("{4 up}"))

slect1() => (MouseMove(744, 891), Sleep(500), clickLeft())
slect2() => (MouseMove(929, 891), Sleep(500), clickLeft())
slect3() => (MouseMove(1109, 891), Sleep(500), clickLeft())
slect4() => (MouseMove(1288, 891), Sleep(500), clickLeft())
slect5() => (MouseMove(1444, 891), Sleep(500), clickLeft())

clickLeft() => (Click("down"), Sleep(100), Click("up"))

upEverything() {
    Click("up")
    Send("{w up}{a up}{d up}{s up}")
    Sleep(500)
}

; --- Color & Image Recognition ---

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
    ; v2 uses parentheses and quotes for CoordMode
    CoordMode("Pixel", "Screen") 
    Sleep(1000)

    ; ImageSearch returns true/false directly in v2. 
    ; No more ErrorLevel! Use & to catch the coordinates.
    if ImageSearch(&gx, &gy, 0, 0, A_ScreenWidth, A_ScreenHeight, "*90 .\images\Buffet.PNG") {
        MouseMove(gx, gy)
        return true
    } else {
        return false
    }
}