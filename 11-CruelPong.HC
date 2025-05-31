fX1 = 600, fY1 = 60, fX2 = 10, fY2 = 60;
sX1 = 600, sY1 = 60, sX2 = 16, sY2 = 60;
ballX = 640/2, ballY = 480/2, ballDiameter = 20;
lives = 1;
ballSpeedX = 1, ballSpeedY = 1;
speed = 10;
U8 ch, sc; // CHAR & ASCII for ScanKey

U0 EnevHandler(CDC* dc) {
    ballX += ballSpeedX;
    ballY += ballSpeedY;

    // Game-Over Borders
    if (ballX <= 0 || ballX >= 650) {
        lives -= 1;
        if (lives <= 0) {
            dc->bkcolor = BLACK;
            GrPrint(dc, 500/2, 200, "Game Over :)");
            GrPrint(dc, 450/2, 220, "Subscribe MatinAfzal");
            Sleep(1000);
            Beep;
            Sleep(1000);
            Beep;
            Sleep(1000);
            Beep;
            DCFill;
            DCClear(dc);
            while(1) {
                Sleep(1);
            }
        } else { // Restart
            Beep;
            ballX = 640/2;
            ballY = 480/2;
        }
    }

    // Bounce Borders
    if (ballY <= 2)
        ballSpeedY *= -1;
    if (ballY >= 450 - ballDiameter)
        ballSpeedY *= -1;

    // Bounce Bricks
    // First check if ball in the same height.
    // Then i check if ball also in the same width.

    // First Brick
    if (ballY >= fY1 && ballY <= (fY1 + fY2))
        if (ballX <= fX1 && ballX >= (fX1 - ballDiameter))
            ballSpeedX *= -1;

    // Second Brick
    if (ballY >= sY1 && ballY <= (sY1 + sY2))
        if (ballX >= sX1 && ballX <= (sX1 + ballDiameter))
            ballSpeedX *= -1;
}

U0 IntrruptHandler() {
    if (ScanKey(&ch, &sc, FALSE)) {
        switch (ch) {
            case 'a':
                if (fY1 >= 2)
                    fY1 -= speed;
                break;
            case 'd':
                if (fY1 <= (450 - 65))
                    fY1 += speed;
                break;
            case 'j':
                if (sY1 >= 2)
                    sY1 -= speed;
                break;
            case 'l':
                if (sY1 <= (450 - 65))
                    sY1 += speed;
                break;
        }
    }
}

U0 ScoreBoard(CDC* dc) {
    U8 buf[256];
    StrPrint(buf, "Total Lives = %d", lives);
    GrPrint(dc, 250, 3, buf);
}

U0 Draw(CDC* dc) {
    ScoreBoard(dc);
    // Ball
    GrFillCircle(dc, ballX, ballY, 0, ballDiameter);

    // Bricks
    GrRect(dc, fX1, fY1, fX2, fY2);
    GrRect(dc, sX1, sY1, sX2, sY2);

    // Borders
    dc->color = RED;
    GrRect(dc, 0, 0, 700, 2);
    GrRect(dc, 0, 450, 700, 2);
    dc->color = BLACK;
}

U0 Pong() {
    CDC* dc = DCAlias;
    dc->bkcolor = BLACK;
    dc->color = BLACK;

    DCClear;
    WinMax;
    while (ms.rb) {
        DCFill;
        EnevHandler(dc);
        IntrruptHandler;
        Draw(dc);
        // I'm using Sleep() to slow down ball speed
        // - didn't find any other way too do it.
        Sleep(12);
    }
    DCFill;
    DCDel(dc);
}Pong;