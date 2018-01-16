class Door
{
  PVector pos;
  PVector size;

  PVector topLeftCorner;
  PVector bottomLeftCorner;
  PVector topRightCorner;
  PVector bottomRightCorner;

  Door(float xPos, float yPos, float xSize, float ySize)
  {
    pos = new PVector(xPos, yPos);
    size = new PVector(xSize, ySize);
  }

  void update()
  {
    rectMode(CORNERS);
    fill(255);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);
  }

  boolean checkPlayerCollision()
  {
    if (dist(c.pos.x, c.pos.y, pos.x, pos.y) <= c.size.y && numOfKeys == 4)
    {
      return true;
    } else return false;
  }
}