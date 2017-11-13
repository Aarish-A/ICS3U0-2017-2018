class Laser
{
  PVector pos, vel, size;

  Laser()
  {
    pos = new PVector(player.pos.x, player.pos.y - player.size.y);
    vel = new PVector(0, 0);
    size = new PVector(10, 25);
  }

  void update()
  {
    switch (laserLevel)
    {
    case 1:
      levelOne();
      break;
    case 2:
      levelTwo();
      break;
    }
  }

  boolean finished()
  {
    if ((pos.y + (pos.y / 2)) < 0) return true;
    else return false;
  }

  void levelOne()
  {
    fill(255, 0, 0);
    rectMode(CENTER);
    vel.y = -5;
    rect(pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  void levelTwo()
  {
    fill(255, 0, 0);
    rectMode(CENTER);
    vel.y = -5;
    rect(pos.x - 7, pos.y, size.x, size.y);
    rect(pos.x + 7, pos.y, size.x, size.y);
    pos.add(vel);
  }
}