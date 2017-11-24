void gameScreen()
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
  if (object == "lasers" && mousePressed == true)
  {
    lasers.add(new Laser());
  }

  if (object == "aliens" && random(0, map(enemyVel, 0.5, 10, 30, 5)) <= 1)
  {
    aliens.add(new Alien(random(width), random(0, 0 - height/6), 30, 25, enemyVel));
  }

  //if (object == "upgrades" && random(0, 750) <= 1)
  if (object == "upgrades" && random(0, 50) <= 1)
  {
    upgrades.add(new Upgrade(random(width), random(0, 0 - height/6), 30, enemyVel));
  }
}

void updateObjects(String list)
{
  if (list == "lasers")
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

  if (list == "aliens")
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

  if (list == "lasers")
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

void checkObjectCollision(String list)
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {

    if (list == "aliens")
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

    if (list == "upgrades")
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

          if (laserLevel < 3)
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
  textFont(defaultFont);
  image(laserImage, width - 100, height - 78, 10, 40);
  text(laserLevel, width - 25, height - 70);
  image(alienImage, width - 100, height - 33, 40, 35);
  text(score, width - 25, height - 25);
}