class Ship
{
  PVector pos;
  PVector size;
  
  Ship()
  {
    pos = new PVector(0, 0);
    size = new PVector(50, 50);
  }
  
  void update()
  {
    fill(255);
    rectMode(CENTER);
    pos.x = mouseX;
    pos.y = mouseY;
    rect(pos.x, pos.y, size.x, size.y);  
  }
}