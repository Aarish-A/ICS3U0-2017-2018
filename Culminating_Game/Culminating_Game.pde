/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */

//GLOBAL VARIABLES
int screenNum;
float startTime;

boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean downPressed;

//INSTRUCTION SCREEN VARIABLES
PImage instructions_screen_1;
PImage instructions_screen_2;
PImage instructions_screen_3;
PImage instructions_screen_4;

//GAME SCREEN VARIABLES
float gameTimer;
int numOfKeys;
int numOfPlatforms;

Char c;
Door d;
ArrayList<Platform> platforms;
ArrayList<KeyPart> keyParts;

void settings()
{
  //size(1000, 600);
  fullScreen();
}

void setup()
{
  frameRate(60);

  //GLOBAL VARIABLES
  screenNum = 0;
  startTime = frameCount;

  rightPressed = false; // A key held down is registered as multiple presses using the 
  leftPressed = false;  // void keyPressed() function, so separate variables are created
  upPressed = false;    // to validate when the key is pressed, then immediately after switch
  downPressed = false;  // them to an "off" state so they are not registered again while held down

  //INSTRUCTION SCREEN VARIABLES
  instructions_screen_1 = loadImage("images/instructions_screen_1.png");
  instructions_screen_2 = loadImage("images/instructions_screen_2.png");
  instructions_screen_3 = loadImage("images/instructions_screen_3.png");
  instructions_screen_4 = loadImage("images/instructions_screen_4.png");

  //GAME SCREEN VARIABLES
  numOfKeys = 0;
  numOfPlatforms = 10;

  c = new Char(width/2, height, 10, 40);
  platforms = new ArrayList<Platform>();
  keyParts = new ArrayList<KeyPart>();

  /* This randomizes the locations of and creates the platforms in a random way
   * the randomization is based off of the last created platform so that the player is not 
   * stuck in a situation where they are unable to reach the next platform 
   */
   
  float[] x = new float[numOfPlatforms]; 
  float[] y = new float[numOfPlatforms];

  for (int i = 0; i < numOfPlatforms; i++)
  {
    if (i == 0)
    {
      x[i] = 150;
      y[i] = height - 200;
    } else 
    {      
      x[i] = random(x[i - 1] + 75, x[i - 1] + 200);
      y[i] = random(y[i - 1] - 80, y[i - 1] - 150);
    }

    platforms.add(new Platform(x[i], y[i], 50, 10));
    if (i > numOfPlatforms - 6 && i < numOfPlatforms - 1) keyParts.add(new KeyPart(x[i], y[i] - 25, 10, 10));
    if (i == numOfPlatforms - 1)   d = new Door(x[i], y[i] - 10, 30, 60);
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
  //Switch to control different screens
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