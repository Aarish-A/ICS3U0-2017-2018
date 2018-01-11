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
    
    if (!grounded)
    {
      accel.y += 0.1;
    } 
    else if (grounded)
    {
      accel.y = 0;
      vel.y = 0;
    }
    
    vel.add(accel);
    pos.add(vel);
    //vel.y += accel.y;
    //pos.y -= vel.y;
  }
  
  void checkGrounded()
  {
    if (pos.y >= height)
    {
      grounded = true;
      pos.y = height;
    }
  }
  
  void checkBreak()
  {
    if (accel.x > 0) {}
  }
}