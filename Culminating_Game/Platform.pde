class Platform
{
  //OBJECT PROPERTIES
  PVector pos;
  PVector vel;
  PVector accel;
  PVector size;

  PVector topLeftCorner;
  PVector bottomLeftCorner;
  PVector topRightCorner;
  PVector bottomRightCorner;

  Platform(float xPos, float yPos, float xSize, float ySize)
  {
    //OBJECT PROPERTIES
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    topLeftCorner = new PVector(pos.x - size.x/2, pos.y - size.y);
    bottomLeftCorner = new PVector(pos.x - size.x/2, pos.y);
    topRightCorner = new PVector(pos.x + size.x/2, pos.y - size.y);
    bottomRightCorner = new PVector(pos.x + size.x/2, pos.y);
  }

  //Updates and draws the platform object
  void update()
  {
    fill(255);
    rectMode(CORNERS);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);
  }

  //Grounds the character to the platform if the character is within
  //a certain range on top of the platform, above the platform, falling down, and
  //the down button is not pressed (therefore pressing down would drop the character
  //from the platform
  void checkPlayerCollision()
  {
    if (abs(c.bottomLeftCorner.x - topLeftCorner.x) < size.x && 
      abs(c.bottomRightCorner.x - topRightCorner.x) < size.x && 
      abs(c.pos.y - (pos.y - size.y)) < 15 && c.vel.y > 0 && !downPressed)
    {
      c.pos.y = pos.y - size.y;
      c.grounded = true;
      c.update();
      c.checkMovement();
    } else if (c.pos.y < height)
    {
      c.grounded = false;
      println("neet");
    }
  }
}