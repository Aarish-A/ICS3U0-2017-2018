/* Aarish Adeel //<>//
 * Assignment 1 — ICS3UO
 * October 4 - , 2017
 */

//INIT CONSTANTS
float gravityAccel;

//INIT EXTERNAL FORCES
float dragCoef;
PVector dragForce;

//INIT AIR PROPERTIES
float airDensity;

//INIT TIME
float time;

//INIT BALL OBJECT
Ball b1;


void settings()
{
  size(500, 600);
}

void setup()
{
  colorMode(HSB);
  //frameRate(10);

  //SET CONSTANTS
  gravityAccel = -9.807 / 60;

  airDensity = 1.225 / 60; //kg per cubic meter

  //SET EXTERNAL FORCES
  dragCoef = 0.5;
  dragForce = new PVector (0, 0);

  //INIT TIME
  time = 0;

  //CREATE BALL OBJECT
  b1 = new Ball();
}

void draw()
{
  drawSetup();
  updateTime();
  b1.updateBall();
  b1.updatePos();
  b1.updateAccel();
  //b1.printBallVectors();
  //printTime();
}

void drawSetup()
{
  //background(b1.pos.y % 255, 150, 230);
  background(255);
  fill(0);
}

void updateTime()
{
  time = millis();
  textSize(25);
  text(time / 1000, 400, 50);
}

void printTime()
{
  println(time / 1000);
}

//http://www.ambrsoft.com/Physics/FreeFall/FreeFallWairResistance.htm