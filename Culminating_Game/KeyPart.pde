class KeyPart
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

  KeyPart(float xPos, float yPos, float xSize, float ySize)
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

  //Updates and draws the key part
  void update()
  {
    rectMode(CORNERS);
    fill(255);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);
  }

  //Returns true if the character is within a certain distance of the key part
  boolean checkPlayerCollision()
  {
    if (dist(c.pos.x, c.pos.y, pos.x, pos.y) < size.x + 10)
    {
      return true;
    } else return false;
  }
}