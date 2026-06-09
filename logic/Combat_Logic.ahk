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
        goingtofusemachine()

        petCount := 0
        while (petCount < 30) {
            fusingPets()
            petCount++
        }
    }
}

goingtofusemachine() {
    MouseMove(150, 500, 5) ;super computer
    Sleep(500)
    clickLeft()
    Sleep(500)
    MouseMove(1000, 600, 5) ;fuse machine
    Sleep(1000)
    clickLeft()
    Sleep(1000)
}

fusingPets() {
    MouseMove(1300, 225) ;search bar
    Sleep(1000)
    clickLeft()
    TypeSlowly("narw") ;type what you want to fuse
    Sleep(1000)
    clickLeft()
    MouseMove(901, 334) ;select the max ammount
    Sleep(100)
    clickLeft()
    Sleep(1000)
    MouseMove(600, 700) ;press Ok
    Sleep(1000)
    clickLeft()
    Sleep(500)
    MouseMove(900, 700) ;press Ok confirmation
    Sleep(1000)
    clickLeft()
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