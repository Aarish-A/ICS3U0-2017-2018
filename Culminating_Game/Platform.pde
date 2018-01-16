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
    fill(255);
    rectMode(CORNERS);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);
  }

  void checkPlayerCollision()
  {
    if (((c.bottomLeftCorner.x > topLeftCorner.x && c.bottomLeftCorner.x < topRightCorner.x) ||
      (c.bottomRightCorner.x > topLeftCorner.x && c.bottomRightCorner.x < topRightCorner.x)) &&
      abs(c.pos.y - (pos.y - size.y)) < 3 && c.vel.y > 0 && !downPressed)
      //if (((c.bottomLeftCorner.x > topLeftCorner.x && c.bottomLeftCorner.x < topRightCorner.x) ||
      //  (c.bottomRightCorner.x > topLeftCorner.x && c.bottomRightCorner.x < topRightCorner.x)) &&
      //  abs(c.pos.y - (pos.y - size.y)) < 3 && c.vel.y > 0 && !downPressed)
    {
      c.pos.y = pos.y - size.y;
      c.grounded = true;
      println("yeet");
    } else if (c.pos.y < height)
    {
      c.grounded = false;
      println("neet");
    }
  }
}