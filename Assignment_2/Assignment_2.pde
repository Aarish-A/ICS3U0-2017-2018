/* Aarish Adeel //<>//
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */

int screenNum;
int laserLevel;
int score;
float enemyVel;

PFont titleFont;
PFont bodyFont;
PFont defaultFont;


PImage shipImage;
PImage laserImage;
PImage alienImage;
PImage upgradeImage;

Ship player;

ArrayList<Laser> lasers;
//Laser laser;

ArrayList<Alien> aliens;
//Alien alien;

ArrayList<Upgrade> upgrades;
//Upgrade upgrade;

void settings()
{
  //size(1000, 600);
  fullScreen();
}

void setup()
{
  screenNum = 0;
  frameRate(60);
  
  laserLevel = 1;
  score = 0; 
  enemyVel = 1;

  titleFont = createFont("fonts/VoiceInMyHead.otf", 25);
  bodyFont = createFont("fonts/Orena.ttf", 25);
  defaultFont = createFont("Lucida Sans", 25);

  shipImage = loadImage("images/spaceship.png");
  laserImage = loadImage("images/laser.png");
  alienImage = loadImage("images/alien.png");
  upgradeImage = loadImage("images/upgrade.png");

  player = new Ship();
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
  upgrades = new ArrayList<Upgrade>();
}


void draw()
{
  switch (screenNum)
  {
    case 0:
      menuScreen();
      break;
    case 1:
      gameScreen();
      break;
    case 2:
      optionsScreen();
      break;
  }
}