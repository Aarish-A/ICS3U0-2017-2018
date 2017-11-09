/* Aarish Adeel
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */
 
 
Ship player;

ArrayList<Laser> lasers;
Laser laser;

ArrayList<Alien> aliens;
Alien alien;
 

void settings()
{
  size(1000, 600);
}

void setup()
{
  player = new Ship();
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
}
 
 
void draw()
{
  background(0);
  
  //if (frameCount % 60 == 0)
  //{
  //  aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  //}
  
  player.update();
  updateLasers();
  updateAliens();
  checkCollision();
}

void updateLasers()
{
  for (int i = lasers.size() - 1; i >= 0; i--)
  {
    Laser laser = lasers.get(i);
    laser.update();
    
    if (laser.finished())
    {
      lasers.remove(i);
    }
  }
}

void updateAliens()
{
  for (int i = aliens.size() - 1; i >= 0; i--)
  {
    Alien alien = aliens.get(i);
    alien.update();
    
    if (alien.finished())
    {
      aliens.remove(i);
    }
  }
}

void checkCollision()
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {
    Laser laser = lasers.get(i);
    for (int j = aliens.size() - 1; i >= 0; i --)
    {
      Alien alien = aliens.get(i);
      PVector d = PVector.sub(laser.pos, alien.pos);
      float distance = d.mag();
      
      if (distance < 5)
      {
        lasers.remove(i);
        aliens.remove(i);
      }
      
      //Alien alien = aliens.get(j);
      //println(aliens.size());
      ////float distance = dist(laser.pos.y, laser.pos.x, alien.pos.y, alien.pos.x);
      ////println(distance);
      
      //if (dist(laser.pos.y, laser.pos.x, alien.pos.y, alien.pos.x) <= 5)
      //{
      //  lasers.remove(i);
      //  aliens.remove(j);
      //  //println(distance);
      //}
    }
  }
}

void mousePressed()
{
  lasers.add(new Laser(5));
  //aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  aliens.add(new Alien(mouseX, random(0, height/6), 15, 1));
}