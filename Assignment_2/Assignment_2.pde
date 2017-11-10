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

  if (frameCount % 60 == 0)
  {
    aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  }

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
    for (int j = aliens.size() - 1; j >= 0; j --)
    {
      //Laser laser = lasers.get(i);
      //Alien alien = aliens.get(j);
      
      //if (dist(laser.pos.x, laser.pos.y, alien.pos.x, alien.pos.y) < 15)
      //{
      //  lasers.remove(i);
      //  aliens.remove(j);
      //}
      
      PVector d = PVector.sub(laser.pos, alien.pos);
      float distance = d.mag();

      if (distance < 10)
      {
        lasers.remove(i);
        aliens.remove(j);
      }
    }
  }
}

void mousePressed()
{
  lasers.add(new Laser(-5));
  //aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  aliens.add(new Alien(mouseX, random(0, height/6), 15, 1));
}