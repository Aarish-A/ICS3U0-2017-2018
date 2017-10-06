/* Aarish Adeel
 * Assignment 1 — ICS3UO
 * October 4 - , 2017
 */

PVector pos, vel, accel; //Initialize PVectors for the ball position, velocity, and acceleration
boolean ballVelRising;
float size;

void setup()
{
  size(300, 1000);
  pos = new PVector (150, 100);
  vel = new PVector (0, 0);
  accel = new PVector (0, 0.09087);
  ballVelRising = false;
  size = 25;
}

void draw()
{
  drawSetup();
  ballFalling();
  ballVelRising();
  printValues();
}

void ballFalling()
{
  if (!ballVelRising) //Ball is falling when the velocity is negative
  {
    updateBall(); 
    if ((pos.y + size/2) > height)
    {
      vel.y *= -1;
      ballVelRising = false;
    }
  }
}

void ballVelRising()
{
  if (ballVelRising) //Ball is rising when the velocity is positive
  {
    updateBall();
    if (vel.y >= 0)
    {
      vel.y = 0;
      ballVelRising = true;
    }
  }
}

void updateBall()
{
  ellipse(pos.x, pos.y, size, size);
  pos.y -= vel.y; //Velocity is subtracted from position so that the ball goes down with a negative velocity
  vel.y -= accel.y; //Similar situation to above
}

void printValues()
{
  println("pos.y is ", pos.y);
  println("vel.y is ", vel.y);
  println("accel.y is ", accel.y);
}

void drawSetup()
{
  background(255);
  fill(0);
}