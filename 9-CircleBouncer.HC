IT32 screenWidth = 640;
IT32 screenHeight = 480;
IT32 posX = screenWidth/2;
IT32 posY = screenHeight/2;
IT32 diameter = 50;

IT32 speedX = 1;
IT32 speedY = 1;

U0 EventHandler(CDC* dc) {
    posX += speedX;
    posY += speedY;

    if (posX >= screenWidth - diameter) {
        speedX *= -1;
        dc->color = RED;
        Beep;
    }
    else if (posX <= 0 + diameter) {
        speedX *= -1;
        dc->color = GREEN;
        Beep;
    }
    else if (posY >= screenHeight - diameter) {
        speedY *= -1;
        dc->color = BLUE;
        Beep;
    }
    else if (posY <= 0 + diameter) {
        speedY *= -1;
        dc->color = BLACK;
        Beep;
    }
}

U0 Main() {
    DocClear;
    WinMax;
    CDC* dc = DCAlias;
    dc->color = YELLOW;

    while(!ms.rb) {
        EventHandler(dc);
        DCFill;
        DCFillCircle(dc, posX, posY, 0, diameter);
        GrPrint(dc, posX, posY, "MatinAfzal");
        Sleep(10);
    }

    DCFill;
    DCDel(dc);
}Main;