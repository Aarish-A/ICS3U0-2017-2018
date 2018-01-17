/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */

int screenNum;
float startTime;
float gameTimer;
int numOfKeys;

boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean downPressed;

PImage instructions_screen_1;
PImage instructions_screen_2;
PImage instructions_screen_3;
PImage instructions_screen_4;

Char c;
Door d;
ArrayList<Platform> platforms;
ArrayList<KeyPart> keyParts;



void settings()
{
  size(1000, 600);
}

void setup()
{
  frameRate(60);

  screenNum = 0;
  startTime = frameCount;
  numOfKeys = 0;

  rightPressed = false;
  leftPressed = false;
  upPressed = false;
  downPressed = false;

  instructions_screen_1 = loadImage("images/instructions_screen_1.png");
  instructions_screen_2 = loadImage("images/instructions_screen_2.png");
  instructions_screen_3 = loadImage("images/instructions_screen_3.png");
  instructions_screen_4 = loadImage("images/instructions_screen_4.png");

  c = new Char(width/2, height, 10, 40);
  d = new Door(width * 4/5 + 100, height - 90, 30, 60);
  platforms = new ArrayList<Platform>();
  keyParts = new ArrayList<KeyPart>();

  for (int i = 0; i < 5; i++)
  {
    platforms.add(new Platform(width * i/5 + 100, height - 80, 50, 10));
    if (i < 4) keyParts.add(new KeyPart(width * i/5 + 100, height - 110, 10, 10));
  }
  //platforms.add(new Platform(width/2, height - 80, 50, 10));
}

void draw()
{
  switch (screenNum)
  {
  case 0:
    instructOne();
    break;
  case 1:
    instructTwo();
    break;
  case 2:
    instructThree();
    break;
  case 3:
    instructFour();
    break;
  case 4:
    gameScreen();
    break;
  case 5:
    endScreen();
    break;
  }
}

void keyPressed()
{
  if (keyCode == RIGHT && !rightPressed) 
  {
    rightPressed = true; 
    c.charTimer = frameCount;
  }

  if (keyCode == LEFT && !leftPressed)
  {
    leftPressed = true;
    c.charTimer = frameCount;
  }

  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN) downPressed = true;

  if (keyCode == ENTER && screenNum == 5) exit();
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN) downPressed = false;
}