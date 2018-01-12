/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */

float startTime;

Char c;

boolean rightPressed;
boolean leftPressed;
boolean upPressed;

void settings()
{
  size(1000, 600);
}

void setup()
{
  c = new Char(width/2, height/2, 10, 40);
}

void draw()
{
  background(255);

  c.update();
  c.checkGrounded();
  c.jump();
  c.moveLateral(leftPressed, rightPressed);
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