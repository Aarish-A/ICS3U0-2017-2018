class Char
{
  PVector pos;
  PVector vel;
  PVector accel;
  PVector size;

  boolean grounded;

  float startTimer;
  float runTimer;

  Char(float xPos, float yPos, float xSize, float ySize)
  {
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    grounded = false;

    startTimer = frameCount;
  }

  void update()
  {
    rectMode(CORNERS);
    rect(pos.x - size.x/2, pos.y - size.y, pos.x + size.x/2, pos.y);

    if (!grounded)
    {
      accel.y += 0.1;
    } else if (grounded)
    {
      accel.y = 0;
      vel.y = 0;
    }

    vel.add(accel);
    pos.add(vel);
  }

  void moveRight()
  { 
    if (rightPressed && !leftPressed)
    {
      runTimer = (frameCount - startTimer) / 60;
      if (runTimer < 0.5) accel.x = 0.1;
      else accel.x = 0; 
      vel.x = 5;
    } else 
    {
      vel.x = 0;
    }
    
    println(startTimer);
    println(runTimer);
  }

  void checkGrounded()
  {
    if (pos.y >= height)
    {
      grounded = true;
      pos.y = height;
    }
  }
}