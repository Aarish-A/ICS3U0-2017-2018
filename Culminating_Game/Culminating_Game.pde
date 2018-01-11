/* Aarish Adeel
 * Programming Culminating
 * ICS 3U0
 * 01/08/18 - 
 */
 
Char c;

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
  c.checkBreak();
}

void keyPressed()
{ 
  if (keyCode == UP)
  {
    c.accel.y = -1;
    c.grounded = false;
  }
  else if (keyCode == RIGHT)
  {
    c.accel.x = 0.1;
  }
  else if (keyCode == LEFT)
  {
    c.accel.x = -0.1;
  }
}