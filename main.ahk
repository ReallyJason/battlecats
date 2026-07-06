#Requires AutoHotkey v2.0
#SingleInstance Force

; Include the core modules
#Include .\core\gui_panel.ahk
#Include .\core\actions.ahk
#Include .\core\input_helpers.ahk

; Hotkeys
F1:: {
    global buttonAction
    switch buttonAction {
        case 1: icydesire()
        case 2: BuffetLevel()
        case 3: opening()
        case 4: fusion()
        case 5: random_mouse_move_loop()
        case 6: move_up_loop()
        case 7: test()
        case 8: goingbackandforth()
        case 9: goingbackandforth_no_catching()
        case 10: fighting_bosses()
        case 11: Sleep(100000)
        case 12: Sleep(100000)
        case 13: Sleep(100000)
        case 14: Sleep(100000)
        case 15: Sleep(100000)
        case 16: Sleep(100000)
        case 17: Sleep(100000)
        case 18: Sleep(100000)
        case 19: Sleep(100000)
        case 20: Sleep(100000)
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