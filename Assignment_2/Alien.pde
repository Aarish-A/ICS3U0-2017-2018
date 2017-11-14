class Alien
{
  PVector pos, vel, size;
  
  Alien(float _x, float _y, float _width, float _height, float _yVel)
  {
    pos = new PVector(_x, _y);
    vel = new PVector(0, _yVel);
    size = new PVector(_width, _height);
  }
  
  void update()
  {
    fill(255);
    //rectMode(CENTER);
    //rect(pos.x, pos.y, size.x, size.y);
    imageMode(CENTER);
    image(alienImage, pos.x, pos.y, size.x, size.y);
    
    pos.add(vel);
  }
  
  boolean finished()
  {
    if ((pos.y - (size.y / 2)) > height) return true;
    else return false;
  }
}