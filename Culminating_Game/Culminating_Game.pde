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
  c.moveRight();

  //if (keyPressed)
  //{

  //  if (rightPressed) c.pos.x += 5;
  //  else if (leftPressed) c.pos.x -=5;

  //  if (upPressed && c.grounded)
  //  {
  //    c.accel.y = -1;
  //    c.grounded = false;
  //  }
  //}
}


void keyPressed()
{
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT) leftPressed = true;
  if (keyCode == UP) upPressed = true;
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == UP) upPressed = false;
}