class Alien
{
  PVector pos;
  PVector vel;
  PVector size;

  Alien(float _x, float _y, float _s, float _yVel)
  {
    pos = new PVector(_x, _y);
    vel = new PVector(0, _yVel);
    size = new PVector(_s, _s);
  }

  void update()
  {
    fill(255);
    rectMode(CENTER);
    rect(pos.x, pos.y, size.x, size.y);
    pos.y += vel.y;
  }

  boolean finished()
  {
    if (checkEdges())
    {
      return true;
    } else 
    {
      return false;
    }
  }

  boolean checkEdges()
  {
    if ((pos.y - (size.y / 2)) > height)
    {
      return true;
    } else {
      return false;
    }
  }
}