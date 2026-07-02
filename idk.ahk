#Requires AutoHotkey v2.0

running := false

F1::{
    global running

    if !running {
        running := true
        Send("e")
        Click("Left")
        SetTimer(DoAction, 1000)
    }
}

F5::{
    global running

    running := false
    SetTimer(DoAction, 0)
}

DoAction() {
    Send("e")
    Click("Left")
}