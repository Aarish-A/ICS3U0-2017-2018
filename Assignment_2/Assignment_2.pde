/* Aarish Adeel //<>//
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */

//Global Variables
int screenNum;
int laserLevel;
int score;
float enemyVel;

//Font Variables
PFont titleFont;
PFont bodyFont;
PFont defaultFont;

//Image Variables
PImage shipImage;
PImage laserImage;
PImage alienImage;
PImage upgradeImage;

//Player ship
Ship player;

//Object Array Lists
ArrayList<Laser> lasers;
ArrayList<Alien> aliens;
ArrayList<Upgrade> upgrades;

void settings()
{
  fullScreen();
}

void setup()
{
  //Global Variables Setup
  screenNum = 0;
  frameRate(60);
  laserLevel = 1;
  score = 0; 
  enemyVel = 1;

  //Font Variables Setup
  titleFont = createFont("fonts/VoiceInMyHead.otf", 25);
  bodyFont = createFont("fonts/Orena.ttf", 25);
  defaultFont = createFont("Lucida Sans", 25);

  //Image Variables Setup
  shipImage = loadImage("images/spaceship.png");
  laserImage = loadImage("images/laser.png");
  alienImage = loadImage("images/alien.png");
  upgradeImage = loadImage("images/upgrade.png");

  //Player Ship Setup
  player = new Ship();
  
  //Object Array Lists Setup
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
  upgrades = new ArrayList<Upgrade>();
}


void draw()
{
  //Different Screens
  switch (screenNum)
  {
    case 0:
      menuScreen();
      break;
    case 1:
      gameScreen();
      break;
  }
}