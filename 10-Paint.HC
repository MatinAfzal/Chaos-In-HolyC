iT32 diameter = 10;
U8* color = "BLACK";
iT8 colorCounter = 0;

iT64 ch, sc; // CHAR and ASCII

U0 LazyForward(CDC* dc) {
    ClearInformation(dc);
}

U0 IntrruptHandler(CDC* dc) {
    if (ScanKey(&ch, &sc, FALSE)) {
        switch (ch) {
            case 'd':
            case 'D':
                DCFill;
                break;

            case 'c':
            case 'C':
                if (colorCounter > 5)
                    colorCounter = 0;
                else
                    colorCounter += 1;

                switch (colorCounter) {
                    case 0:
                        color = "RED";
                        dc->color = RED;
                        break;
                    case 1:
                        color = "GREEN";
                        dc->color = GREEN;
                        break;
                    case 2:
                        color = "BLUE";
                        dc->color = BLUE;
                        break;
                    case 3:
                        color = "BLACK";
                        dc->color = BLACK;
                        break;
                    case 4:
                        color = "YELLOW";
                        dc->color = YELLOW;
                        break;
                    case 5:
                        color = "PURPLE";
                        dc->color = PURPLE;
                        break;
                }
                DCFill;
                break;

            case 'w':
            case 'W':
                diameter += 1;
                LazyForward(dc);
                break;

            case 's':
            case 'S':
                diameter -= 1;
                LazyForward(dc);
                break;
        }
    }
}

U0 PrintInformation(CDC infoDC) {
    U8 buf[256];
    StrPrint(buf, "Thickness = %d", diameter);
    GrPrint(infoDC, 20, 10, buf);
    StrPrint(buf, "Color = %s", color);
    GrPrint(infoDC, 20, 20, buf);
}

U0 ClearInformation(CDC* infoDC) {
    infoDC->color = WHITE;
    // GrRect(infoDC, 0, 0, 150, 60);
    infoDC->color = BLACK;
    DCFill;
}

U0 Paint() {
    CDC* .dc = DCAlias;
    dc->color = BLACK;

    DocClear;
    WinMax;

    while (!ms.rb) {
        IntrruptHandler(dc);
        PrintInformation(dc);

        while (ms.lb) {
            GrFillCircle(dc, ms.pos.x, ms.pos.y, 0, diameter);
            Sleep(1);
        }

        Sleep(1);
    }

    DCFill(dc);
    DCDel(dc);

}Paint;
