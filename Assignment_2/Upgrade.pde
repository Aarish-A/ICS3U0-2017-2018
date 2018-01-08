class Upgrade
{
  //Upgrade object properties
  PVector pos, vel, size;

  Upgrade(float _x, float _y, float _s, float _yVel)
  {
    pos = new PVector(_x, _y);
    vel = new PVector(0, _yVel);
    size = new PVector(_s, _s);
  }

  //Draws and updates upgrades based on its coordinates and velocity
  void update()
  {
    imageMode(CENTER);
    image(upgradeImage, pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  //Checks to see if the upgrade is off the screen to delete it ("finished")
  boolean finished()
  {
    if ((pos.y - (size.y / 2)) > height) return true;
    else return false;
  }
}