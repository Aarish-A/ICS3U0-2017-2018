class Alien
{
  //Alien Properties 
  PVector pos, vel, size;
  
  Alien(float _x, float _y, float _width, float _height, float _yVel)
  {
    pos = new PVector(_x, _y);
    vel = new PVector(0, _yVel);
    size = new PVector(_width, _height);
  }
  
  //Draws and updates alien based on its coordinates and velocity
  void update()
  {
    fill(255);
    imageMode(CENTER);
    image(alienImage, pos.x, pos.y, size.x, size.y);
    
    pos.add(vel);
  }
  
  //Checks to see if the alien is off the screen to delete it ("finished")
  boolean finished()
  {
    if ((pos.y - (size.y / 2)) > height) return true;
    else return false;
  }
}