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

goingtofusemachinewhileegghatching() {
    ; MouseMove(150, 550, 5) ;super computer
    ; Sleep(100)
    ; clickLeft()
    while (!shopColor()) {
        Sleep(50)
    }
    Sleep(300)

    Send("g")
    Sleep(100)
    MouseMove(1000, 600, 5) ;fuse machine
    Sleep(100)
    clickLeft()
    Sleep(100)
}

fusingPetswhileegghatching() {
    MouseMove(1300, 225, 5) ;search bar
    ;Sleep(100)
    clickLeft()
    TypeSlowly("eagle") ;type what you want to fuse
    ;Sleep(100)
    clickLeft()
    MouseMove(901, 334, 5)  ;select the max ammount
    ;#1 = 901, 334
    ;#2 = 1053, 338
    ;#3 = 1202, 323
    ;#4 = 1355, 331
    ;Sleep(100)
    clickLeft()
    if (!PS99_greenok()) {
        return false
    }
    MouseMove(600, 700, 5) ;press Ok
    clickLeft()
    MouseMove(900, 700, 5) ;press Ok confirmation
    if (!PS99_greenok2()) {
        return false
    }
    clickLeft()
    Sleep(100)
    return true
}


goingtofusemachine() {
    Send("6")
    MouseMove(1000, 600, 5) ;fuse machine
    clickLeft()
}

fusingPets() {
    MouseMove(1300, 225, 5) ;search bar
    clickLeft()
    TypeSlowly("eagle") ;type what you want to fuse
    clickLeft()
    MouseMove(901, 334, 5)  ;select the max ammount
    ;#1 = 901, 334
    ;#2 = 1053, 338
    ;#3 = 1202, 323
    ;#4 = 1355, 331
    clickLeft()
    if (!PS99_greenok()) {
        return false
    }
    MouseMove(600, 700, 5) ;press Ok
    clickLeft()
    Sleep(1000)
    MouseMove(900, 700, 5) ;press Ok confirmation
    if (!PS99_greenok2()) {
        return false
    }
    clickLeft()
    return true
}

goingbackandforth() {
    while (true) {
        Send("{a down}")
        Sleep(1000)
        Send("{a up}")
        battling_evomons()
        more_tries_catching()

        Sleep(100)
        Send("{s down}")
        Sleep(1000)
        Send("{s up}")
        battling_evomons()
        more_tries_catching()

        Sleep(100)
        Send("{d down}")
        Sleep(1000)
        Send("{d up}")
        battling_evomons()
        more_tries_catching()

        Sleep(100)
        Send("{w down}")
        Sleep(1000)
        Send("{w up}")
        battling_evomons()
        more_tries_catching()

        Sleep(100)
    }
}

goingbackandforth_catching() {
    while (true) {
        Send("{a down}")
        Sleep(1000)
        Send("{a up}")

        Sleep(100)
        Send("{s down}")
        Sleep(1000)
        Send("{s up}")

        Sleep(100)
        Send("{d down}")
        Sleep(1000)
        Send("{d up}")

        Sleep(100)
        Send("{w down}")
        Sleep(1000)
        Send("{w up}")

        Sleep(100)
    }
}

battling_evomons() {
    if (question_mark_top()) {
        Sleep(1000)
        while (!shiny_color_left()) {
            Sleep(1000)
        }
        Sleep(1500)
        if (shiny_color_middle() or hundred_percent_shiny_green() or prismatic_color_middle()) {
            Send("{F5}")
            Sleep(5000)
        }
        if (hundred_percent_prismatic_green()) {
            Sleep(100)
            Send("{c down}"), Sleep(100), Send("{c up}")
            Sleep(1000)
        } else {
            Sleep(100)
            Send("{e down}"), Sleep(100), Send("{e up}")
            Sleep(1000)
        }
    }
}

more_tries_catching() {
    if (shiny_color_middle() or hundred_percent_shiny_green() or prismatic_color_middle()) {
        Send("{F5}")
        Sleep(5000)
    }
    if (shiny_color_left()) {
        Send("{e down}"), Sleep(100), Send("{e up}")
    }
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