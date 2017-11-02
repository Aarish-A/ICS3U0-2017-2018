/* Aarish Adeel //<>//
 * Assignment 1
 * ICS 3U0
 * 10/13/17 - 11/02/17
 */

//GLOBAL VARIABLES
int screenNum;

//START SCREEN VARIABLES
float startScreenTime;
int inputD;
int inputM;
int inputY;
float sliderDX;
float sliderMX;
float sliderYX;
boolean sliderDP;
boolean sliderMP;
boolean sliderYP;

//BOUNCE SCREEN VARIABLES
float gAccel;
float airDensity;
float dragC;
float time;
float finalTime;
PVector dragF;
boolean ballBouncing;
Ball b1;

void settings()
{
  size(600, 600);
}

void setup()
{
  //GLOBAL SETUP
  frameRate(60);
  screenNum = 0;

  //START SCREEN SETUP
  startScreenTime = 0;
  inputD = 0;
  inputM = 0;
  inputY = 0;
  sliderDX = 50;
  sliderMX = 50;
  sliderYX = 50;
  sliderDP = false;
  sliderMP = false;
  sliderYP = false;

  //BOUNCE SCREEN SETUP
  gAccel = -9.807 / 3600; //Meters per frame squared
  airDensity = 1.225; //Kilograms per cubic meter
  dragC = 0.5; //Unitless
  time = 0; //Seconds
  dragF = new PVector (0, 0); //Newtons
  ballBouncing = true;
}

void draw()
{
  //Display screen based on screenNum
  switch (screenNum)
  {
  case 0:
    startScreen();
    break;
  case 1:
    bounceScreen();
    break;
  case 2:
    endScreen();
    break;
  }
}