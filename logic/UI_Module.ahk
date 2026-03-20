#Requires AutoHotkey v2.0

global buttonAction := 0
global MainGui := Gui("+AlwaysOnTop", "Main Screen")

MainGui.OnEvent("Close", (*) => ExitApp())
MainGui.Add("Text",, "Reminder that F1 starts, and F5 stops")

; Buttons
MainGui.Add("Button", "w100", "Lucky ticket -> Icy desire").OnEvent("Click", (*) => SetAction(1))
MainGui.Add("Button", "w100", "Buffet").OnEvent("Click", (*) => SetAction(2))
MainGui.Add("Button", "w100", "Opening Lucky").OnEvent("Click", (*) => SetAction(3))
MainGui.Add("Button", "w100", "Reload Game").OnEvent("Click", (*) => SetAction(4))
MainGui.Add("Button", "w100", "Exit").OnEvent("Click", (*) => ExitApp())
MainGui.Add("Button", "x150 y106 w50", "Test").OnEvent("Click", (*) => SetAction(7))

MainGui.Show("w350 h400")

SetAction(val) {
    global buttonAction := val
    MainGui.Hide()
}