// Sprites are not included in this source, so you need to create them yourself
// you have to press ctrl-R to create the sprite, and then use the Sprite function
// to point to the sprite you created with ctrl-R like this: Sprite3(dc, 0, 0, 0, <1>)
// <1> is the pointer to the sprite you created

I64 glbl_r[4][4];

U0 Draw(CTask*, CDC* dc) {
    I64* old_r = dc->r;
    dc->x = 300;
    dc->y = 250;
    dc->r = GR_2DALL;
    dc->flags = DCF_TRANSFORMATION;
    DCPushBufAlloc(dc);
    DCMat4x4Set(dc, glbl_r);
    DCDepthBufRst(dc);
    // Sprite3(dc, 0, 0, 0, <2>); Point to your sprite HERE !
    dc->r = old_r;
}

U0 Main() {
    F64 θ = 0, ϕ = 0;
    F64 PI = 3.14;

    DocClear;
    WinMax;

    SettingsPush;
    FS->draw_it = &Draw;

    while (!ms.rb) {
        Mat4x4IdentEqu(glbl_r);
        Mat4x4RotX(glbl_r, θ);
        Mat4x4RotZ(glbl_r, ϕ);

        Sleep(40);
        θ += 2 * PI / 100;
        ϕ += 2 * PI / 130;
    }

    SettingsPop;
}Main;