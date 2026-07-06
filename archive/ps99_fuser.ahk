#Requires AutoHotkey v2.0
#SingleInstance Force

global robloxHwnd := 0
global macroActive := false

; ── STEP 1: LOCK ROBLOX ───────────────────────────────────────────────
; Go to Desktop 2, click inside Roblox, and press F1.
F1:: {
    global robloxHwnd
    robloxHwnd := WinExist("A")
}

; ── STEP 2: START / STOP THE LOOP ─────────────────────────────────────
; Press F2 from Desktop 1 to start or stop the auto-fuser.
F2:: {
    global macroActive, robloxHwnd
    if (robloxHwnd == 0) {
        MsgBox("Error: Target Roblox first using F1 on Desktop 2!")
        return
    }

    macroActive := !macroActive
    if (macroActive) {
        ToolTip("PS99 Fuser: RUNNING")
        ; Run the fusion loop on a background thread so it doesn't freeze AHK
        SetTimer(fusion, -10)
    } else {
        ToolTip("PS99 Fuser: STOPPING")
    }
    Sleep(1500)
    ToolTip()
}

F3:: {
    bgType("eagle")
}

F5:: {
    Click("up")
    Send("{w up}{a up}{d up}{s up}")
    Reload()
}

; ── STEP 3: CONVERTED BACKGROUND ACTIONS ──────────────────────────────
fusion() {
    global macroActive, robloxHwnd

    while (macroActive) {
        if !WinExist("ahk_id " robloxHwnd)
            break

        goingtofusemachine()

        ; FIXED: Put braces around the break condition
        if (!macroActive) {
            break
        }

        petCount := 0
        while (petCount < 100 && macroActive) {
            if (!fusingPets()) {
                break
            }
            petCount++
            Sleep(500) ; Brief rest between merges
        }
    }
}

goingtofusemachine() {
    global robloxHwnd
    ; Super computer click
    bgClick(220, 600)
    Sleep(200)

    ; Fuse machine click
    bgClick(1000, 650)
    Sleep(500)
}

fusingPets() {
    global robloxHwnd

    ; Click search bar
    bgClick(1300, 225)
    Sleep(300)

    ; Type "eagle" via background input
    bgType("eagle")
    Sleep(300)

    ; Click item slot #1 to select max amount
    bgClick(880, 334)
    Sleep(400)
    ;1 = 880, 334
    ;2 = 1042, 334
    ;3 = 1199, 334
    ;4 = 1358, 334

    ; Check if the green fuse button popped up

    ; Press Fuse/Ok
    bgClick(600, 700)
    Sleep(400)

    ; Press Ok confirmation
    bgClick(900, 700)
    Sleep(800) ; Wait for the fusion animation to finish

    return true
}

; ── STEP 4: BACKGROUND SIMULATION WRAPPERS ────────────────────────────

bgClick(x, y) {
    global robloxHwnd

    ; Send the mouse DOWN command ("D") at the coordinates
    ControlClick("X" x " Y" y, "ahk_id " robloxHwnd, , , , "NA D")

    ; Hold it for 200 milliseconds
    Sleep(200)

    ; Send the mouse UP command ("U") at the exact same coordinates
    ControlClick("X" x " Y" y, "ahk_id " robloxHwnd, , , , "NA U")
}

bgType(text) {
    global robloxHwnd

    ; Ignores the 'text' parameter entirely and just sends "a"
    ControlSend("a", , "ahk_id " robloxHwnd)
}

PS99_greenok() {
    global robloxHwnd
    startTime := A_TickCount

    ; PixelSearch normally checks your active monitor. To check a hidden background
    ; window on another desktop, you MUST maximize Roblox on Desktop 2 so Windows
    ; continues updating its background pixels buffer.
    while (A_TickCount - startTime < 1000) {
        if PixelSearch(&gx, &gy, 500, 650, 750, 750, 0x0EF781, 30) { ; Reversed BGR format to RGB format match
            return true
        }
        Sleep(20)
    }
    return false
}