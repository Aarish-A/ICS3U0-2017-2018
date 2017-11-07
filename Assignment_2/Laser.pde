class Laser
{
  PVector pos;
  PVector size;

  Laser()
  {
    pos = new PVector(player.pos.x, player.pos.y - player.size.y);
    size = new PVector(10, 25);
  }

  void update()
  {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(pos.x, pos.y, size.x, size.y);
    pos.y -= 5;
  }

  boolean finished()
  {
    if (checkEdges()) return true;
    else return false;
  }

  boolean checkEdges()
  {
    if ((pos.y + (pos.y / 2)) < 0) return true;
    else return false;
  }
}