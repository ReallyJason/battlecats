#Requires AutoHotkey v2.0
#SingleInstance Force

; Include the other modules
#Include .\logic\UI_Module.ahk
#Include .\logic\Combat_Logic.ahk
#Include .\logic\Utils_Library.ahk

; Hotkeys
F1:: {
    global buttonAction
    switch buttonAction {
        case 1: icydesire()
        case 2: BuffetLevel()
        case 3: opening()
        case 4: Reload_Game()
        case 5: random_mouse_move_loop()
        case 6: move_up_loop()
        case 7: test()
    }
}

F5:: {
    if (buttonAction != 101) {
        upEverything()
        Reload()
    } else {
        ExitApp()
    }
}