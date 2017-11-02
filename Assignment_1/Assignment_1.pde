//Global variables //<>//
int screenNum;

//Variables for start screen
int propertyNum;
float startScreenTime;
char letter;
int inputD;
int inputM;
int inputY;
float slider1;
float slider2;
float slider3;

//Variables for bounce screen
float gAccel;
float airDensity;
float dragC;
float time;
float finalTime;
PVector dragF;
boolean ballBouncing;
Ball b1;

//Variables for end screen



void settings()
{
  size(600, 600);
}

void setup()
{
  //Global setup
  frameRate(60);
  screenNum = 0; //Screen number

  //Variables for start screen
  propertyNum = 0;
  startScreenTime = 0;
  letter = key;
  inputD = 0;
  inputM = 0;
  inputY = 0;
  slider1 = 50;
  slider2 = 50;
  slider3 = 50;

  //Variables for bounce screen
  gAccel = -9.807 / 3600; //Meters per second squared
  airDensity = 1.225; //Kilograms per cubic meter
  dragC = 0.5; //Arbritrary value
  time = 0; //Seconds
  dragF = new PVector (0, 0); //Newtons (kilograms * meters per second squared)
  ballBouncing = true;
}

void draw()
{
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