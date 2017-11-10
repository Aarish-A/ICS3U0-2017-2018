class Laser
{
  PVector pos, vel, size;

  Laser(float _yVel)
  {
    pos = new PVector(player.pos.x, player.pos.y - player.size.y);
    vel = new PVector(0, _yVel);
    size = new PVector(10, 25);
  }

  void update()
  {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  boolean finished()
  {
    if ((pos.y + (pos.y / 2)) < 0) return true;
    else return false;
  }
}