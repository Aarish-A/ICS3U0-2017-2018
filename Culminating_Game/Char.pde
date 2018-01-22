class Char
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

  boolean grounded; //Is true when the object is either on the "ground" or a platform
  float charTimer; //Internal timer for the character, separate from the game timer

  Char(float xPos, float yPos, float xSize, float ySize)
  {
    //OBJECT PROPERTIES
    pos = new PVector(xPos, yPos);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = new PVector(xSize, ySize);

    grounded = true;
    charTimer = frameCount;
  }

  void update()
  {
    //Coordinates of the corners are updated based on the objects current position
    topLeftCorner = new PVector(pos.x - size.x/2, pos.y - size.y);
    bottomLeftCorner = new PVector(pos.x - size.x/2, pos.y);
    topRightCorner = new PVector(pos.x + size.x/2, pos.y - size.y);
    bottomRightCorner = new PVector(pos.x + size.x/2, pos.y);

    rectMode(CORNERS);
    fill(255);
    rect(topLeftCorner.x, topLeftCorner.y, bottomRightCorner.x, bottomRightCorner.y);

    //Object is falling due to "gravity" when it is not grounded and is still otherwise
    if (!grounded)
    {
      accel.y += 0.1;
    } else if (grounded)
    {
      accel.y = 0;
      vel.y = 0;
    }

    //Vector addition to the velocity and position to move the object
    vel.add(accel);
    pos.add(vel);
  }

  //This function grounds the object if it is at the bottom of the screen or the "ground"
  void checkGrounded()
  {
    if (pos.y >= height)
    {
      grounded = true;
      pos.y = height;
    }
  }

  //Updates object acceleration/velocity based on arrow key commands
  void checkMovement()
  { 
    //The object "jumps" when the up button is pressed only while grounded (to prevent
    //jumping while in the air)
    if (upPressed && grounded)
    {
      accel.y = -1.6;
      grounded = false;
    }

    //Adds positive/negative acceleration based on whether the right or left button is pressed
    //the object accelerates for a certain amount of time dicated by the run timer until it reaches
    //a maximum velocity and moves at a constant speed
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
}