/* Aarish Adeel
 * Assignment 1 — ICS3UO
 * October 4 - , 2017
 */

//INIT BALL OBJECT
Ball b1;

//INIT CONSTANTS
float gravityAccel;

//INIT EXTERNAL FORCES
float dragCoef;
PVector dragForce;

//INIT AIR PROPERTIES
float airDensity;


void settings()
{
  size(500, 1000);
}

void setup()
{
  colorMode(HSB);

  //SET CONSTANTS
  gravityAccel = -9.807 / 60;

  airDensity = 0.001225; //kg per cubic meter

  //SET EXTERNAL FORCES
  dragCoef = 0.47;
  dragForce = new PVector (0, 0);

  //CREATE BALL OBJECT
  b1 = new Ball();
}

void draw()
{
  drawSetup();
  b1.updateBall();
  b1.updatePos();
  b1.updateAccel();
  b1.printBallVectors();
  //printValues();
}

void drawSetup()
{
  background(b1.pos.y % 255, 150, 230);
  fill(0);
}