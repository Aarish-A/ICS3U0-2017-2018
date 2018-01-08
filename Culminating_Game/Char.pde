class Char
{
  PVector pos;
  PVector vel;
  PVector accel;
  PVector size;

  boolean grounded;

  Char(float xPos, float yPos, float xSize, float ySize)
  {
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    grounded = false;
  }

  void update()
  {
    rectMode(CORNERS);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);

    if (grounded)
    {
      accel.y = 0;
      //vel.y = 0;
    } else 
    {
      accel.y = -3;
    }

    vel.y += accel.y;
    pos.y -= accel.y;
  }
  
  void checkGrounded()
  {
  }
}