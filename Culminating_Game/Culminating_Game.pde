/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */

int screenNum;
float startTime;
float gameTimer;
int numOfKeys;
int numOfPlatforms;

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

  screenNum = 4;
  startTime = frameCount;
  numOfKeys = 0;
  numOfPlatforms = 10;

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

  float[] x = new float[numOfPlatforms]; 
  float[] y = new float[numOfPlatforms];

  for (int i = 0; i < numOfPlatforms; i++)
  {
    if (i == 0)
    {
      x[i] = width / 2;
      y[i] = height - 100;
    } else 
    {
      if (i % 2 == 0) x[i] = random(x[0] - width / 2, x[0]);
      else x[i] = random(x[0], x[0] + width / 2);
      
      //x[i] = random(x[i - 1] - 75, x[i - 1] + 250);
      y[i] = random(y[i - 1] - 40, y[i - 1] - 90);
    }

    platforms.add(new Platform(x[i], y[i], 50, 10));
    if (i > numOfPlatforms - 5) keyParts.add(new KeyPart(x[i], y[i] - 25, 10, 10));
  }

  //for (int i = 0; i < 5; i++)
  //{
  //  platforms.add(new Platform(width * i/5 + 100, height - 80, 50, 10));
  //  if (i < 4) keyParts.add(new KeyPart(width * i/5 + 100, height - 110, 10, 10));
  //}

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