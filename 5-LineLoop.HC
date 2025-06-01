U0 Lines() {
  CDC* dc = DCAlias;
  dc->color=RED;
  while(1) {
    GrLine(dc, 0, 0, ms.pos.x, ms.pos.y);
    Sleep(1);
  }
  DCFill(dc);
  DCDel(dc);
}
Lines;