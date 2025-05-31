iT32 screenWidth = 640;
iT32 screenHeight = 480;
iT32 posX = screenWidth/2;
iT32 posY = screenHeight/2;
iT32 diameter = 50;

iT32 speedX = 1;
iT32 speedY = 1;

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
    CDC* .dc = DCAlias;
    dc->color = YELLOW;

    while(!ms.rb) {
        EventHandler(dc);
        DCFill;
        DCFillCircle(dc, posX, posY, 0, diameter);
        SGrPrint(dc, posX, posY, "MatinAfzal");
        Sleep(10);
    }

    DCFill;
    DCDel(dc);
}Main;