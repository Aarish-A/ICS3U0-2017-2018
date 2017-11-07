/* Aarish Adeel
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */

//Player's ship objects
Ship player = new Ship();

//Laser objects
ArrayList<Laser> lasers;
Laser laser;

//Enemy alien objects
ArrayList<Alien> aliens;
Alien alien;

void settings()
{
  size(1000, 600);
}

void setup()
{
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
}

void draw()
{
  background(0);
  player.update();

  for (int i = lasers.size()-1; i >= 0; i--)
  {
    Laser laser = lasers.get(i);
    laser.update();
    
    if (laser.finished())
    {
      lasers.remove(i);
    }
  }

  for (int i = aliens.size()-1; i >= 0; i--)
  {
    Alien alien = aliens.get(i);
    alien.update();
    if (alien.finished())
    {
      aliens.remove(i);
    }
  }
}

void mousePressed()
{
  lasers.add(new Laser());
  aliens.add(new Alien(random(width), random(0, height/5), 15, 1));
  println("Lasers:", lasers.size());
  println("Aliens:", aliens.size());
}