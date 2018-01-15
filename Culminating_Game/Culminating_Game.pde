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

void settings()
{
  size(1000, 600);
}

void setup()
{
  c = new Char(width/2, height, 10, 40);
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(width/2, height - 80, 50, 10));
}

void draw()
{
  background(255);

  c.update();
  c.checkGrounded();
  c.jump();
  c.moveLateral(leftPressed, rightPressed);

  for (Platform p : platforms)
  {
    p.update();

    if (abs(c.bottomLeftCorner.x - p.bottomLeftCorner.x) < (p.size.x - c.size.x) && abs(c.bottomRightCorner.x - p.bottomRightCorner.x) < (p.size.x - c.size.x)
      && abs(p.pos.y - c.pos.y) < 3)
      {
        c.pos.y = p.pos.y;
        c.grounded = true;
        println("yeet");
      }
      else if (c.pos.y < height)
      {
        c.grounded = false;
        println("neet");
      }
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
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == UP) upPressed = false;
}