/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */

float startTime;

Char c;
ArrayList<Platform> platforms; 

boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean downPressed;

void settings()
{
  size(1000, 600);
}

void setup()
{
  frameRate(60);

  c = new Char(width/2, height, 10, 40);
  platforms = new ArrayList<Platform>();

  for (int i = 0; i < 5; i++)
  {
    //float x = random(100, width - 100);
    //float y = random(height - 100, height - 50);
    //platforms.add(new Platform(x, y, 50, 10));
    
    platforms.add(new Platform(width * i/5 + 100, height - 80, 50, 10));
  }

  //platforms.add(new Platform(width/2, height - 80, 50, 10));
}

void draw()
{
  background(255);

  c.update();
  c.checkGrounded();
  c.jump();
  c.moveLateral();

  //for (int i = platforms.size() - 1; i >= 0; i--) 
  //{
  //  Platform p = platforms.get(i);
  //  p.update();
  //  p.checkPlayerCollision();
  //}

  for (Platform p : platforms)
  {
    p.update();
    p.checkPlayerCollision();
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
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN) downPressed = false;
}