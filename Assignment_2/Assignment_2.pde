/* Aarish Adeel //<>//
 * Assignment 2
 * ICS 3U0
 * 11/06/17 - 
 */

int laserLevel;
int score;
float enemyVel;

PImage shipImage;
PImage laserImage;
PImage alienImage;
PImage upgradeImage;

Ship player;

ArrayList<Laser> lasers;
//Laser laser;

ArrayList<Alien> aliens;
//Alien alien;

ArrayList<Upgrade> upgrades;
//Upgrade upgrade;

void settings()
{
  //size(1000, 600);
  fullScreen();
}

void setup()
{
  laserLevel = 1;
  score = 0; 
  enemyVel = 1;

  shipImage = loadImage("spaceship.png");
  laserImage = loadImage("laser.png");
  alienImage = loadImage("alien.jpg");
  upgradeImage = loadImage("upgrade.png");

  player = new Ship();
  lasers = new ArrayList<Laser>();
  aliens = new ArrayList<Alien>();
  upgrades = new ArrayList<Upgrade>();
}


void draw()
{
  background(0);

  player.update();

  spawnObjects("lasers");
  spawnObjects("aliens");
  spawnObjects("upgrades");

  updateObjects("lasers");
  updateObjects("aliens");
  updateObjects("upgrades");

  checkPlayerCollision();
  checkObjectCollision("aliens");
  checkObjectCollision("upgrades");

  showStats();

  enemyVel += 0.002;
}

void spawnObjects(String object)
{
  if (object == "lasers")
  {
    if (mousePressed == true)
    {
      lasers.add(new Laser());
    }
  }

  if (object == "aliens")
  {
    if (random(0, map(enemyVel, 0.5, 10, 30, 5)) <= 1)
    {
      aliens.add(new Alien(random(width), random(0, 0 - height/6), 30, enemyVel));
    }
  }

  if (object == "upgrades")
  {
    if (random(0, 750) <= 1)
    {
      upgrades.add(new Upgrade(random(width), random(0, 0 - height/6), 30, enemyVel));
    }
  }
}

void updateObjects(String object)
{
  if (object == "lasers")
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

  if (object == "aliens")
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

  if (object == "lasers")
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
}

void checkPlayerCollision()
{
  for (Alien alien : aliens)
  {
    PVector d = PVector.sub(player.pos, alien.pos);
    float distance = d.mag();

    if (distance < 30)
    {
      println("Game Over");
      exit();
    }
  }
}

void checkObjectCollision(String object)
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {

    if (object == "aliens")
    {
      for (int j = aliens.size() - 1; j >= 0; j --)
      {
        Laser laser = lasers.get(i);
        Alien alien = aliens.get(j);

        PVector d = PVector.sub(laser.pos, alien.pos);
        float distance = d.mag();

        if (distance < 20)
        {
          lasers.remove(i);
          aliens.remove(j);
          score += 1;
        }
      }
    } 

    if (object == "upgrades")
    {
      for (int j = upgrades.size() - 1; j >= 0; j --)
      {
        Laser laser = lasers.get(i);
        Upgrade upgrade = upgrades.get(j);
        //println("Lasers:", lasers.size());
        //println("Aliens:", aliens.size());

        PVector d = PVector.sub(laser.pos, upgrade.pos);
        float distance = d.mag();

        if (distance < 20)
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
}

void showStats()
{
  fill(255);
  textSize(25);
  textAlign(RIGHT);
  image(laserImage, width - 100, height - 78, 10, 40);
  text(laserLevel, width - 25, height - 70);
  image(alienImage, width - 100, height - 33, 40, 40);
  text(score, width - 25, height - 25);
}