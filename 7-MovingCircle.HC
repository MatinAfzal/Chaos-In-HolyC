I16 posX = 640 / 2;
I16 posY = 480 / 2;
I16 speed = 50;

I16 ch, sc;

U0 DrawCircle(CDC* dc) {
    GrCircle(dc, posX, posY, 30);
}

U0 InterruptHandler() {
    if (ScanKey(&ch, &sc, FALSE)) {
        switch (ch) {
            case 'w':
            case 'W':
                posY -= speed;
                break;
            case 'a':
            case 'A':
                posX -= speed;
                break;
            case 's':
            case 'S':
                posY += speed;
                break;
            case 'd':
            case 'D':
                posX += speed;
                break;
        }
    }
}

U0 Main() {
    DocClear;
    WinMax;
    CDC* dc = DCAlias;
    dc->color = GREEN;

    while (!ms.rb) {
        InterruptHandler();
        DrawCircle(dc);
        Sleep(1);
    }

    DCFill(dc);
    DCDel(dc);
}Main;