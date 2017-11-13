class Ship
{
  PVector pos, size;

  Ship()
  {
    pos = new PVector(0, 0);
    size = new PVector(50, 50);
  }

  void update()
  {
    //fill(255);
    //rectMode(CENTER);
    //rect(pos.x, pos.y, size.x, size.y);

    pos.x = mouseX;
    pos.y = mouseY;
    imageMode(CENTER);
    image(shipImage, pos.x, pos.y, size.x, size.y);
  }
}