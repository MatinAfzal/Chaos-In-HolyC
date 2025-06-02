// Sprites are not included in this source, so you need to create them yourself
// you have to press ctrl-R to create the sprite, and then use the Sprite function
// to point to the sprite you created with ctrl-R like this: Sprite3(dc, 0, 0, 0, <1>)
// <1> is the pointer to the sprite you created

U0 Draw(CDC* dc) {
    // Sprite3(dc, 50, 50, 0, <1>); Point to your sprite HERE !
    // Sprite3(dc, 50, 60, 0, <2>); Point to your sprite HERE !
}

U0 Main() {
    DocClear;
    WinMax;
    I32 i;
    CDC* dc = DCAlias;
    while (!ms.rb) {
        DCFill;
        Draw(dc);
        Sleep(1);
    }
    DCFill;
    DCDel(dc);
}
Main;