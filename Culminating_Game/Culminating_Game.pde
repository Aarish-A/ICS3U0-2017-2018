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
  
  println(c.pos.y);
  println(c.vel.y);
  println(c.accel.y);
}

void keyPressed()
{
  if (keyCode == UP)
  {
    c.vel.y = 1000;
    c.grounded = false;
  }
}