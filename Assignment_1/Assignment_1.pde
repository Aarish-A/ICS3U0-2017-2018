/* Aarish Adeel
 * Assignment 1 — ICS3UO
 * October 4 - , 2017
 */

//INITIALIZE CONSTANTS
float gravityAccel;

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
float dragCoef;
PVector dragForce;

//INITIALIZE AIR PROPERTIES
float airDensity;


void settings()
{
  size(500, 1000);
}

void setup()
{
  //SETUP CONSTANTS
  gravityAccel = -9.807;

  //SETUP BALL PROPERTIES 
  ballMass = 15; //Arbritrary value
  ballWeight = ballMass * gravityAccel;
  size = 25;
  refArea = (2 * TWO_PI * ((size/2) * (size/2)));   

  //SETUP BALL VECTORS
  ballPos = new PVector (250, 100);
  ballVel = new PVector (0, 0);
  ballAccel = new PVector (0, 0);

  //SETUP AIR PROPERTIES
  airDensity = 1.225;

  //SETUP EXTERNAL FORCES
  dragCoef = 0.47;
  dragForce = new PVector (0, 0);  
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
  dragForce.y = dragCoef * ((airDensity * (ballVel.y * ballVel.y)) / 2) * refArea;
  //ballAccel.y = (ballWeight - dragForce.y) / ballMass;
  println(dragForce.y);
}

void updatePos()
{
  if ((ballPos.y) >= height)
  {
    ballVel.y *= -1;
    ballPos.y = height;
    //println(ballVel.y);
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