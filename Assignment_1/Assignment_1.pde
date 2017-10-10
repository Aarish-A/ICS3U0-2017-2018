/* Aarish Adeel
 * Assignment 1 — ICS3UO
 * October 4 - , 2017
 */

//INITIALIZE BALL PROPERTIES
float ballMass;
float ballWeight;
float size;
float refArea;

//INITIALIZE BALL VECTORS
PVector ballPos;
PVector ballVel;
PVector ballAccel;

//INITIALIZE EXTERNAL FORCES
PVector dragForce;
float dragCoef;
float gravityAccel;

//INITIALIZE AIR PROPERTIES
float airDensity;


void settings()
{
  size(500, 1000);
}

void setup()
{
  //SETUP BALL PROPERTIES
  size = 25;
  
  //SETUP BALL VECTORS
  ballPos = new PVector (250, 100);
  ballVel = new PVector (0, 0);
  ballAccel = new PVector (0, -0.09087);
  
  //SETUP EXTERNAL FORCES
  
  //SETUP AIR PROPERTIES
}

void draw()
{
  drawSetup();
  drawBall();
  updateAccel();
  updatePos();
  //printValues();
}

void drawSetup()
{
  background(255);
  fill(0);
}

void drawBall()
{
  ellipse(ballPos.x, ballPos.y, size, size);
}

void updateAccel()
{
    
}

void updatePos()
{
  if ((ballPos.y) >= height)
  {
    ballVel.y *= -1;
    ballPos.y = height;
    println(ballVel.y);
  }

  ballPos.y += ballVel.y; 

  if (!(ballPos.y + ballVel.y > height))
  {
    ballVel.y -= ballAccel.y; //Acceleration is subtracted from position so that the velocity decreases with a negative acceleration
  }
}

void printValues()
{
  println("pos.y is ", ballPos.y);
  println("vel.y is ", ballVel.y);
  println("accel.y is ", ballAccel.y);
}