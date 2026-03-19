#Requires AutoHotkey v2.0

global Movex := 0, Movey := 0

; Generic Level Selector
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

; Input Helpers
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
upEverything() => (Click("up"), Send("{w up}{a up}{d up}{s up}"))