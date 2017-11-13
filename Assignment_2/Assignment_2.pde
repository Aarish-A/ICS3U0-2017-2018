/* Aarish Adeel
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */

int laserLevel;
Ship player;

ArrayList<Laser> lasers;
Laser laser;

ArrayList<Alien> aliens;
Alien alien;

ArrayList<Upgrade> upgrades;
Upgrade upgrade;


void settings()
{
  size(1000, 600);
}

void setup()
{
  laserLevel = 1;
  player = new Ship();
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
  upgrades = new ArrayList<Upgrade>();
}


void draw()
{
  background(0);

  player.update();
  updateLasers();
  updateAliens();
  updateUpgrades();
  checkAlienCollision();
  checkUpgradeCollision();
  createLasers();
  spawnAliens();
  spawnUpgrades();
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

void updateUpgrades()
{
  for (int i = upgrades.size() - 1; i >= 0; i--)
  {
    Upgrade upgrade = upgrades.get(i);
    upgrade.update();

    if (upgrade.finished())
    {
      upgrades.remove(i);
    }
  }
}

void checkAlienCollision()
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {
    for (int j = aliens.size() - 1; j >= 0; j --)
    {
      Laser laser = lasers.get(i);
      Alien alien = aliens.get(j);
      //println("Lasers:", lasers.size());
      //println("Aliens:", aliens.size());

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

void checkUpgradeCollision()
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {
    for (int j = upgrades.size() - 1; j >= 0; j --)
    {
      Laser laser = lasers.get(i);
      Upgrade upgrade = upgrades.get(j);
      //println("Lasers:", lasers.size());
      //println("Aliens:", aliens.size());

      PVector d = PVector.sub(laser.pos, upgrade.pos);
      float distance = d.mag();

      if (distance < 10)
      {
        lasers.remove(i);
        upgrades.remove(j);
        if (laserLevel < 2)
        {
          laserLevel += 1;
        }
      }
    }
  }
}

void createLasers()
{
  if (frameCount % 60 <= 45)
  {
    lasers.add(new Laser());
  }
}


void spawnAliens()
{
  if (frameCount % 60 <= 10)
  {
    aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  }
}

void spawnUpgrades()
{
  if (frameCount % 60 == 0)
  {
    upgrades.add(new Upgrade(random(width), random(0, height/6), 15, 1));
  }
}

void mousePressed()
{
  //lasers.add(new Laser(-5));
  //aliens.add(new Alien(random(width), random(0, height/6), 15, 1));
  //aliens.add(new Alien(mouseX, random(0, height/6), 15, 1));
}