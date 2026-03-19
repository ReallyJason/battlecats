    Gui, Main: +AlwaysOnTop
    Gui, Main: Add, Text,, Reminder that F1 starts, and F5 stops
    Gui, Main: Add, Button, gButton1, Lucky ticket -> Icy desire
    Gui, Main: Add, Button, gButton2, Buffet
    Gui, Main: Add, Button, gButton3, Opening Lucky
    Gui, Main: Add, Button, gButton4, nothing
    Gui, Main: Add, Button, gButton5, nothing
    Gui, Main: Add, Button, gButton6, nothing
    Gui, Main: Add, Button, gButton51, Exit

    Gui, Main: Add, Button, x150 y106 gButton7, Test
    ;Gui, Main: Add, Button, gButton8, nothing
    ;Gui, Main: Add, Button, gButton9, nothing
    ;Gui, Main: Add, Button, gButton10, nothing
    ;Gui, Main: Add, Button, gButton51, Exit
    Gui, Main: Show, w350 h400, Main Screen

    Global buttonAction
    Global sleepTimeforW
    Global sleepTime
    Global Movex
    Global Movey

    ShowMain:
    Gui, Screen1: Hide
    Gui, Screen2: Hide
    Gui, Main: Show
    Return

    ;icydesire
    Button1:
    Gui, Hide
    Global buttonAction := 1
    Return

    Button2:
    Gui, Hide
    Global buttonAction := 2
    Return

    Button3:
    Gui, Hide
    Global buttonAction := 3
    Return

    Button4:
    Gui, Hide
    Global buttonAction := 4
    Return

    Button5:
    Gui, Hide
    Global buttonAction := 5
    Return

    Button6:
    Gui, Hide
    Global buttonAction := 6
    Return

    Button7:
    Gui, Hide
    Global buttonAction := 7
    Return


    Button51:
    Gui, Hide
    Global buttonAction := 51
    Return

    F1::
    if (buttonAction = 1){
        icydesire()
    }else if (buttonAction = 2){
        BuffetLevel()
    }else if (buttonAction = 3){
        opening()
    }else if (buttonAction = 4){

    }else if (buttonAction = 5){
        
    }else if (buttonAction = 6){
        
    }else if (buttonAction = 7){
        test()
    }
    
    Return

    F5:: ; Press F5 to release the left mouse button, W, A, and Shift (and show GUI)
    if(buttonAction != 51){
        upEverything()
        Reload
    }else{
        GuiClose:
        ExitApp
    }
    ;---------------------------------------------------------------Functions below
    icydesire(){
        selectLevel("redOnSelect") ;redOnSelect & CatsInTheSnow CatFruitBuffet
        Sleep, 3000
        fighticydesire()
        icydesire() ; restart loop
    }
    BuffetLevel(){
        selectLevel("redOnSelect")
        Sleep, 3000
        while(!startbuttoncolor()){
            fightBuffet()
        }
        BuffetLevel()
    }
    opening(){
        if(!LuckyCapsuleColor()){
            Reload
        }
        press4()
        Sleep, 10000
        Loop, 20{
            press4()
            Sleep, 500
        }
        Sleep, 1000
        opening()
    }
    test(){
        fightBuffet()
        test()
    }
    ;--------------------------------------------------------helper functions
    upEverything(){
        Click, up
        Send, {w up}
        Send, {a up}
        Send, {d up}
        Send, {s up}
        Sleep, 500
    }
    fighticydesire(){
        Loop, 5{
            Sleep, 2500
            slect1() ;summon tank
            if(!YellowPause()){
                Reload
            }
        }
        while(!buhmreadyforsum()){
            Sleep, 500
        }
        slect3()
        Sleep, 1000
        while(!itemReward() And !yesbutton() And !startbuttoncolor()){
            Sleep, 500
        }
        MouseMove, 857, 877 ;move to endge of the item screen
        Loop, 3{
            Sleep, 500
            clickLeft() ;click left 4 times just in case of enigma stage
        }
        Sleep, 1000
        if(yesbutton()){
            press3()
        }
        Sleep, 500
    }
    fightBuffet(){
        While(!izumisumm()){
            Sleep, 500
        }
        slect4() ;summon izumi
        Sleep, 1000
        slect4() ;summon izumi ability
        Sleep, 2000
        slect1()
        if(!YellowPause()){
            Reload
        }
        While(!phonoasumm()){
            Sleep, 500
        }
        slect5() ;summon phonoa
        
        Sleep, 2000
        while(!itemReward() And !yesbutton() And !startbuttoncolor()){
            slect1()
            sleep,500
            slect2()
            sleep,500
            if(buhmreadyforsum()){
                slect3()
            }
            Sleep, 1000
        }

        MouseMove, 857, 877 ;move to endge of the item screen
        Loop, 3{
            Sleep, 500
            clickLeft() ;click left 4 times just in case of enigma stage
        }
        Sleep, 1000
        if(yesbutton()){
            press3()
        }
        Sleep, 500
    }

    selectLevel(stage){
        Sleep, 500
        press2() ;start in menu select
        Sleep, 2000
        MouseMove, 937, 688

        While(true){
            if(%stage%()){
                MouseMove, Movex, Movey
                Sleep, 500
                clickLeft()
                Break
            }Else{
                Send {WheelDown 1}
                Sleep, 2000
            }
        }
        Sleep, 2000
        press1() ;attack the stage
        Sleep, 1000
        if(redFlag()){
            Sleep, 1000
            press3() ;incase you have no energy
            Sleep, 1000
            press1() ;attack again
            Sleep, 1000
        }
    }
    ;---------------------------------------------------------------Helper Functions below
    yesOnFlag(){
        if(CheckFlag){
            ;MsgBox, Flag Found
            MouseMove, 907, 667
            Sleep, 500
            Click, Left
        }Else{
            ;MsgBox, Flag Not Found
        }
    }
    CheckFlag(){
        PixelSearch, gx, gy, 798, 627, 981, 682, 0x0E19CC, 0, Fast RGB;
        if (ErrorLevel = 0){
            Return true
        }
        PixelSearch, gx, gy, 798, 627, 981, 682, 0xCC190E, 0, Fast RGB;
        if (ErrorLevel = 0){
            Return true
        }
    }
    press2(){
        Send, {2 down}
        Sleep, 100
        Send, {2 up}
    }
    press1(){
        Send, {1 down}
        Sleep, 100
        Send, {1 up}
    }
    press3(){
        Send, {3 down}
        Sleep, 100
        Send, {3 up}
    }
    press4(){
        Send, {4 down}
        Sleep, 100
        Send, {4 up}
    }
    slect1(){
        MouseMove, 744, 891
        Sleep, 500
        clickLeft()
    }
    slect2(){
        MouseMove, 929, 891
        Sleep, 500
        clickLeft()
    }
    slect3(){
        MouseMove, 1109, 891
        Sleep, 500
        clickLeft()
    }
    slect4(){
        MouseMove, 1288, 891
        Sleep, 500
        clickLeft()
    }
    slect5(){
        MouseMove, 1444, 891
        Sleep, 500
        clickLeft()
    }
    clickLeft(){
        Click, down
        Sleep, 100
        Click, up
    }
    randomClick(){
        Sleep, 500
        MouseMove, 1855, 219
        Sleep, 1000
        Click, Left
        Sleep, 500
        MouseMove, 1658, 186
        Sleep, 1000
        Click, Left
        Sleep, 4000
    }
    ;-----------------------------------------------------------------Color
    yesbutton(){
        PixelSearch, gx, gy, 796, 609, 1036, 717, 0xFFC423, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        } 
    }
    startbuttoncolor(){
        PixelSearch, gx, gy, 347, 304, 535, 391, 0xF7BB00, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    izumisumm(){
        PixelSearch, gx, gy, 1184, 839, 1356, 957, 0xFCF8F0, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    phonoasumm(){
        PixelSearch, gx, gy, 1369, 841, 1536, 956, 0xFBF8F2, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    itemReward(){
        PixelSearch, gx, gy, 903, 754, 991, 784, 0xFFFF00, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    buhmreadyforsum(){
        PixelSearch, gx, gy, 1013, 838, 1174, 900, 0xD89600, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    redOnSelect(){
        PixelSearch, gx, gy, 590, 196, 630, 730, 0xFF5700, 0, Fast rgb;
        if (ErrorLevel = 0){
            Movex:=gx
            Movey:=gy
            Return true
        }
    }
    YellowMoneyInStage(){
        PixelSearch, gx, gy, 1428, 105, 1873, 177, 0xFFF000, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    redFlag(){
        PixelSearch, gx, gy, 700, 370, 800, 450, 0x36362E, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
        PixelSearch, gx, gy, 700, 370, 800, 450, 0xD34032, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    YellowPause(){
        PixelSearch, gx, gy, 327, 102, 406, 168, 0xFFCC00, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    LuckyCapsuleColor(){
        PixelSearch, gx, gy, 806, 241, 832, 255, 0xF19D2F, 0, Fast rgb;
        if (ErrorLevel = 0){
            Return true
        }
    }
    ;--------------------------------------------------------
    CatsInTheSnow(){
        ImageSearch, gx, gy, 329, 90, 924, 897, D:\Codes\Pictures\CatsInTheSnow.PNG, 50
        if (ErrorLevel = 0){
            Movex:=gx
            Movey:=gy
            Return true
        }else{
            return false
        }
    }
    CatFruitBuffet(){
        CoordMode, Pixel
        Sleep, 1000
        ImageSearch, gx, gy, 329, 227, 900, 777, D:\Codes\Pictures\Buffet.PNG, 240
        if (ErrorLevel = 0){
            Movex:=gx
            Movey:=gy
            Return true
        }else{
            return false
        }
        Sleep, 1000
    }