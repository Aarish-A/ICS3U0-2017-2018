class Upgrade
{
  PVector pos, vel, size;

  Upgrade(float _x, float _y, float _s, float _yVel)
  {
    pos = new PVector(_x, _y);
    vel = new PVector(0, _yVel);
    size = new PVector(_s, _s);
  }

  void update()
  {
    //fill(#FA9A1C);
    //rectMode(CENTER);
    //rect(pos.x, pos.y, size.x, size.y);

    imageMode(CENTER);
    image(upgradeImage, pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  boolean finished()
  {
    if ((pos.y - (size.y / 2)) > height) return true;
    else return false;
  }
}