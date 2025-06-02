U0 DrawLine(CDC* dc, I16 px1, I16 py1, I16 px2, I16 py2) {
    GrLine(dc, px1, py1, px2, py2);
}

U0 Main() {
    WinMax;
    DocClear;
    CDC* dc = DCAlias;
    dc->color = RED;
    dc->thick = 60;
    I16 px1, px2, py1, py2;
    U8 f1 = 'N', f2 = 'N';
    while (!ms.rb) {
        if (ms.lb && f1 == 'N') {
            px1 = ms.pos.x;
            py1 = ms.pos.y;
            f1 = 'Y';
	    Sleep(100);
        }
        else if (ms.lb && f1 == 'Y' && f2 == 'N') {
            px2 = ms.pos.x;
            py2 = ms.pos.y;
            f2 = 'Y';
	    Sleep(100);
        }
        else if (f1 == 'Y' && f2 == 'Y') {
            DrawLine(dc, px1, py1, px2, py2);
            f1 = 'N';
            f2 = 'N';
	    Sleep(100);
        }
        Sleep(50);
    }
    DCFill(dc);
    DCDel(dc);
}Main;
