#Requires AutoHotkey v2.0

global buttonAction := 0
global MainGui := Gui("+AlwaysOnTop -MaximizeBox -MinimizeBox", "🐱 Battle Cats Bot Panel")

; ═══════════════════════════════════════════════
; 🎨 Theme: "Midnight Cat"
;    Deep navy with warm cat-inspired accents
; ═══════════════════════════════════════════════
clrBg := "0D1117"    ; Deep midnight background
clrTitle := "FF6B35"    ; Warm orange (cat fur)
clrSub := "8B949E"    ; Muted silver-gray
clrFarming := "FFD93D"    ; Golden amber
clrUtils := "56D364"    ; Fresh green
clrSlots := "79C0FF"    ; Soft sky blue
clrAccent := "FF7B72"    ; Coral pink
clrDivider := "30363D"    ; Subtle divider

; ═══════════════════════════════════════════════
; 🏷️ Button Names — edit these to rename buttons
; ═══════════════════════════════════════════════
Slot1 := "Lucky → Icy Desire"
Slot2 := "Buffet"
Slot3 := "Opening Lucky"
Slot4 := "Doing the Fusion"
Slot5 := "Random Mouse Move"
Slot6 := "Move Up"
Slot7 := "Run Test"
Slot8 := "Back && Forth"
Slot9 := "Back && Forth (No Catch)"
Slot10 := "Fighting Bosses"
Slot11 := "Slot 11"
Slot12 := "Slot 12"
Slot13 := "Slot 13"
Slot14 := "Slot 14"
Slot15 := "Slot 15"
Slot16 := "Slot 16"
Slot17 := "Slot 17"
Slot18 := "Slot 18"
Slot19 := "Slot 19"
Slot20 := "Slot 20"

MainGui.BackColor := clrBg
MainGui.MarginX := 20
MainGui.MarginY := 15

; ═══════════════════════════════════════════════
; Header
; ═══════════════════════════════════════════════
MainGui.SetFont("s15 Bold c" clrTitle, "Segoe UI")
MainGui.Add("Text", "w540 Center BackgroundTrans", "🐱  BATTLE CATS  🐱")

MainGui.SetFont("s9 c" clrSub, "Segoe UI")
MainGui.Add("Text", "w540 Center BackgroundTrans", "F1 → Start Action  │  F5 → Stop / Reload")

; Divider line
MainGui.Add("Text", "w540 h2 Background" clrDivider)

; ═══════════════════════════════════════════════
; Column 1: Farming & Loops
; ═══════════════════════════════════════════════
MainGui.SetFont("s10 Bold c" clrFarming, "Segoe UI")
MainGui.Add("GroupBox", "w170 h290 Section", "🎰 Farming && Loops")

MainGui.SetFont("s9 Norm", "Segoe UI")
MainGui.Add("Button", "xs+15 ys+28 w140 h30", Slot1).OnEvent("Click", (*) => SetAction(1))
MainGui.Add("Button", "xp y+6 w140 h30", Slot2).OnEvent("Click", (*) => SetAction(2))
MainGui.Add("Button", "xp y+6 w140 h30", Slot3).OnEvent("Click", (*) => SetAction(3))
MainGui.Add("Button", "xp y+6 w140 h30", Slot4).OnEvent("Click", (*) => SetAction(4))
MainGui.Add("Button", "xp y+6 w140 h30", Slot8).OnEvent("Click", (*) => SetAction(8))
MainGui.Add("Button", "xp y+6 w140 h30", Slot9).OnEvent("Click", (*) => SetAction(9))

; ═══════════════════════════════════════════════
; Column 2: Utilities
; ═══════════════════════════════════════════════
MainGui.SetFont("s10 Bold c" clrUtils, "Segoe UI")
MainGui.Add("GroupBox", "x+15 ys w170 h290 Section", "🔧 Utilities")

MainGui.SetFont("s9 Norm", "Segoe UI")
MainGui.Add("Button", "xs+15 ys+28 w140 h30", Slot5).OnEvent("Click", (*) => SetAction(5))
MainGui.Add("Button", "xp y+6 w140 h30", Slot6).OnEvent("Click", (*) => SetAction(6))
MainGui.Add("Button", "xp y+6 w140 h30", Slot7).OnEvent("Click", (*) => SetAction(7))

; Status indicator
MainGui.SetFont("s8 c" clrSub, "Segoe UI")
MainGui.Add("Text", "xp y+30 w140 Center BackgroundTrans", "─── Status ───")
MainGui.SetFont("s8 c" clrAccent, "Segoe UI")
MainGui.Add("Text", "xp y+4 w140 Center BackgroundTrans", "● Idle")

; Exit button aligned to bottom of column
MainGui.SetFont("s9 Bold", "Segoe UI")
MainGui.Add("Button", "xs+15 ys+248 w140 h30", "❌ Exit Program").OnEvent("Click", (*) => ExitApp())

; ═══════════════════════════════════════════════
; Column 3: Expansion Slots (10–15)
; ═══════════════════════════════════════════════
MainGui.SetFont("s10 Bold c" clrSlots, "Segoe UI")
MainGui.Add("GroupBox", "x+15 ys w170 h290 Section", "📦 Slots (10–15)")

MainGui.SetFont("s9 Norm", "Segoe UI")
MainGui.Add("Button", "xs+15 ys+28 w140 h30", Slot10).OnEvent("Click", (*) => SetAction(10))
MainGui.Add("Button", "xp y+6 w140 h30", Slot11).OnEvent("Click", (*) => SetAction(11))
MainGui.Add("Button", "xp y+6 w140 h30", Slot12).OnEvent("Click", (*) => SetAction(12))
MainGui.Add("Button", "xp y+6 w140 h30", Slot13).OnEvent("Click", (*) => SetAction(13))
MainGui.Add("Button", "xp y+6 w140 h30", Slot14).OnEvent("Click", (*) => SetAction(14))
MainGui.Add("Button", "xp y+6 w140 h30", Slot15).OnEvent("Click", (*) => SetAction(15))

; ═══════════════════════════════════════════════
; Bottom Row: More Expansion Slots (16–20)
; ═══════════════════════════════════════════════
MainGui.SetFont("s10 Bold c" clrSlots, "Segoe UI")
MainGui.Add("GroupBox", "x20 y+62 w540 h70 Section", "📦 Slots (16–20)")

MainGui.SetFont("s9 Norm", "Segoe UI")
MainGui.Add("Button", "xs+12 ys+25 w96 h30", Slot16).OnEvent("Click", (*) => SetAction(16))
MainGui.Add("Button", "x+8 yp w96 h30", Slot17).OnEvent("Click", (*) => SetAction(17))
MainGui.Add("Button", "x+8 yp w96 h30", Slot18).OnEvent("Click", (*) => SetAction(18))
MainGui.Add("Button", "x+8 yp w96 h30", Slot19).OnEvent("Click", (*) => SetAction(19))
MainGui.Add("Button", "x+8 yp w96 h30", Slot20).OnEvent("Click", (*) => SetAction(20))

; ═══════════════════════════════════════════════
; Footer
; ═══════════════════════════════════════════════
MainGui.Add("Text", "x20 y+12 w540 h2 Background" clrDivider)
MainGui.SetFont("s8 c" clrSub, "Segoe UI")
MainGui.Add("Text", "x20 y+8 w540 Center BackgroundTrans", "🐾 Battle Cats Bot v1.0  •  Made with ♥")

MainGui.OnEvent("Close", (*) => ExitApp())
MainGui.Show()

SetAction(val) {
    global buttonAction := val
    MainGui.Hide()
}