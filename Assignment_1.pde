






/*
 * This program assumes that a positive velocity indicates downward motion, whereas 
 * a negative velocity indicates an upward motion
 */


/*
float yPos = 100;
float xPos = 150;

float yVel = 0;
float yAccel = 0.09087;
boolean posVel = false;

float size = 25;

void setup()
{
  size(300, 1000);
}

void draw()
{
  drawSetup();
  ballFalling();
  ballRising();
  printValues();
}

void ballFalling()
{
  if (posVel)
  {
    updateBall(); 
    if ((yPos + size/2) > height)
    {
      yVel *= -1;
      posVel = false;
    }
  }
}

void ballRising()
{
  if (!posVel)
  {
    updateBall();
    if (yVel >= 0)
    {
      yVel = 0;
      posVel = true;
    }
  }
}

void updateBall()
{
  ellipse(xPos, yPos, size, size);
  yPos += yVel;
  yVel += yAccel;
}

void printValues()
{
  println("yPos is ", yPos);
  println("yVel is ", yVel);
  println("yAccel is ", yAccel);
}

void drawSetup()
{
  background(255);
  fill(0);
}
*/