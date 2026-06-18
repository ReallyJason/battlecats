#Requires AutoHotkey v2.0
#Include .\Utils_Library.ahk
#Include .\image_color.ahk

icydesire() {
    while (true) {
        selectLevel(redOnSelect) ; We pass the function object itself now
        Sleep(3000)
        fighticydesire()
        icydesire()
    }
}

fusion() {
    while (true) {
        SendMode "Event"
        Sleep(500)
        goingtofusemachine()

        petCount := 0
        while (petCount < 100) {
            if (!fusingPets()) {
                break
            }
            petCount++
        }
    }
}

goingtofusemachine() {
    MouseMove(150, 550, 5) ;super computer
    Sleep(100)
    clickLeft()
    Sleep(100)
    MouseMove(1000, 600, 5) ;fuse machine
    Sleep(100)
    clickLeft()
    Sleep(100)
}

fusingPets() {
    MouseMove(1300, 225, 5) ;search bar
    Sleep(100)
    clickLeft()
    TypeSlowly("eagle") ;type what you want to fuse
    Sleep(100)
    clickLeft()
    MouseMove(901, 334, 5)  ;select the max ammount
    ;#1 = 901, 334
    ;#2 = 1053, 338
    ;#3 = 1202, 323
    ;#4 = 1355, 331
    Sleep(100)
    clickLeft()
    Sleep(100)
    if (!PS99_greenok()) {
        return false
    }
    MouseMove(600, 700, 5) ;press Ok
    Sleep(300)
    clickLeft()
    MouseMove(900, 700, 5) ;press Ok confirmation
    Sleep(500)
    if (!PS99_greenok2()) {
        return false
    }
    clickLeft()
    Sleep(100)
    return true
}

TypeSlowly(text) {
    Loop Parse, text {
        Send(A_LoopField)
        Sleep(20)
    }
}

BuffetLevel() {
    while (true) {
        selectLevel(CatFruitBuffet)
        Sleep(3000)
        while (!startbuttoncolor()) {
            fightBuffet()
        }
    }
}

opening() {
    while (true) {
        if (!LuckyCapsuleColor())
            Reload()

        press4()
        Sleep(10000)
        Loop 20 {
            press4()
            Sleep(500)
        }
        Sleep(1000)
    }
}

test() {
    while (true) {
        fightBuffet()
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

random_mouse_move_loop() {
    while (true) {
        random_mouse_move()
        Sleep(100)
    }
}

random_mouse_move() {
    MouseMove(200, 100, 50)
    Sleep(20000)
    MouseMove(200, 200, 50)
    Sleep(20000)
}

move_up_loop() {
    while (true) {
        move_up()
        Sleep(100)
    }
}

move_up() {
    Send("{W down}"),
        Sleep(200),
        Send("{W up}"),
        Sleep(60000 * 6)
}