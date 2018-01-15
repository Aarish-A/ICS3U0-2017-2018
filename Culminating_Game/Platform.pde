class Platform
{
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
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    topLeftCorner = new PVector(pos.x - size.x/2, pos.y - size.y);
    bottomLeftCorner = new PVector(pos.x - size.x/2, pos.y);
    topRightCorner = new PVector(pos.x + size.x/2, pos.y - size.y);
    bottomRightCorner = new PVector(pos.x + size.x/2, pos.y);
  }

  void update()
  {
    rectMode(CORNERS);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);
  }
}