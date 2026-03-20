#Requires AutoHotkey v2.0
#Include .\Utils_Library.ahk
#Include .\image_color.ahk

icydesire() {
    while(true){
        selectLevel(redOnSelect) ; We pass the function object itself now
        Sleep(3000)
        fighticydesire()
        icydesire() 
    }
}

BuffetLevel() {
    while(true){
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

Reload_Game() {
    Send("{Esc}"), Sleep(2000)
    Send("{L}"), Sleep(3000) ;leave game button
    MouseMove(800, 450), Sleep(1000) ;confirm leave
    clickLeft(),Sleep(1000)
    clickLeft(),Sleep(15000)
    MouseMove(175, 350), Sleep(1000) ;first game icon
    MouseMove(175, 550), Sleep(1000) ;play first game button
    clickLeft(), Sleep(1000)
    MouseMove(900, 250), Sleep(1000) ;Play button incase you are in the description screen
    clickLeft(), Sleep(1000)
    clickLeft(), Sleep(14000)
    clickLeft(), Sleep(1000) ;Click anywhere to bypass title screen
    Reload()
}