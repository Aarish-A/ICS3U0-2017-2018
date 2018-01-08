class Ship
{
  //Ship properties
  PVector pos, size;

  Ship()
  {
    pos = new PVector(0, 0);
    size = new PVector(50, 50);
  }

  //Draws and updates ship based on mouser coordinates
  void update()
  {
    pos.x = mouseX;
    pos.y = mouseY;
    imageMode(CENTER);
    image(shipImage, pos.x, pos.y, size.x, size.y);
  }
}