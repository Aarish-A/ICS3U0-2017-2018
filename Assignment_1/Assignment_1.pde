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
  accel = new PVector (0, 0.5);
  ballVelRising = false;
  size = 25;
}

void draw()
{
  drawSetup();
  ball();
  updateBall();
  //printValues();
}

void drawSetup()
{
  background(255);
  fill(0);
}

void ball()
{
  if ((pos.y) >= height)
  {
    vel.y *= -1; //hard reset velocity y
   // vel.y += accel.y;
    //pos.y = height;
    println(vel.y);
  }
}

void updateBall()
{
  ellipse(pos.x, pos.y, size, size);
  pos.y += vel.y; //Velocity is subtracted from position so that the ball goes down with a negative velocity
  if (!(pos.y + vel.y > height))
  {
    vel.y += accel.y; //Similar situation to above
  }
}

void printValues()
{
  println("pos.y is ", pos.y);
  println("vel.y is ", vel.y);
  println("accel.y is ", accel.y);
}