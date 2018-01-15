class Char
{
  PVector pos;
  PVector vel;
  PVector accel;
  PVector size;

  PVector topLeftCorner;
  PVector bottomLeftCorner;
  PVector topRightCorner;
  PVector bottomRightCorner;

  boolean grounded;

  float charTimer;

  Char(float xPos, float yPos, float xSize, float ySize)
  {
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    grounded = true;

    charTimer = frameCount;
  }

  void update()
  {
    topLeftCorner = new PVector(pos.x - size.x/2, pos.y - size.y);
    bottomLeftCorner = new PVector(pos.x - size.x/2, pos.y);
    topRightCorner = new PVector(pos.x + size.x/2, pos.y - size.y);
    bottomRightCorner = new PVector(pos.x + size.x/2, pos.y);

    rectMode(CORNERS);
    rect(topLeftCorner.x, topLeftCorner.y, bottomRightCorner.x, bottomRightCorner.y);

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

  void moveLateral(boolean leftPressed, boolean rightPressed)
  { 
    if (leftPressed || rightPressed)
    {
      float runTimer = (frameCount - charTimer) / 60;

      if (runTimer < 0.5)
      {
        if (rightPressed) accel.x = 0.2;
        if (leftPressed) accel.x = -0.2;
      } else 
      {
        accel.x = 0;

        if (rightPressed) vel.x = 6;
        if (leftPressed) vel.x = -6;
      }
    } else 
    {
      accel.x = 0;
      vel.x = 0;
    }
  }

  void jump()
  {
    if (upPressed && grounded)
    {
      accel.y = -1.3;
      grounded = false;
    }
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