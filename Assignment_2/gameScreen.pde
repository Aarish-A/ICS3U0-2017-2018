//Actual game screen
void gameScreen()
{
  background(0);

  //Updates the player's ship
  player.update();

  //Spawns all non-ship objects
  spawnObjects("lasers");
  spawnObjects("aliens");
  spawnObjects("upgrades");

  //Updates all non-ship objects
  updateObjects("lasers");
  updateObjects("aliens");
  updateObjects("upgrades");

  //Checks for collision between all objects
  checkPlayerCollision();
  checkObjectCollision("aliens");
  checkObjectCollision("upgrades");

  //Displays statistics (laser level and score)
  showStats();

  //Increases the enemy velocity as time goes on to make the game harder
  enemyVel += 0.002;
}

//Spawns objects based on the string parameter
void spawnObjects(String object)
{
  if (object == "lasers" && mousePressed == true)
  {
    //Creates a new laser from the ship
    lasers.add(new Laser());
  }

  //Random chance to create an enemy alien at any given frame, rate of spawn mapped to their velocity which increases
  if (object == "aliens" && random(0, map(enemyVel, 0.5, 10, 30, 5)) <= 1)
  {
    //Creates a new alien with a random position above the visible screen
    aliens.add(new Alien(random(width), random(0, 0 - height/6), 30, 25, enemyVel));
  }

  //Random chance to create a upgrade at any frame
  if (object == "upgrades" && random(0, 750) <= 1)
  {
    //Creates a new upgrade with a random position above the visible screen
    upgrades.add(new Upgrade(random(width), random(0, 0 - height/6), 30, enemyVel));
  }
}

//Updates the objects based on the string parameter
void updateObjects(String list)
{
  //Updates and deletes lasers if they are "finished"
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

  //Updates and deletes enemy aliens if they are "finished"
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

  //Updates and deletes upgrades if they are "finished"
  if (list == "upgrades")
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

//Checks for player collision with aliens, ends the game if the player "dies"
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

//Checks alien and upgrade collision with laser based on string parameter
void checkObjectCollision(String list)
{
  for (int i = lasers.size() - 1; i >= 0; i --)
  {
    //Checks collision and deletes alien if laser hits the alien
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

    //Checks collision and deletes the upgrade if laser hits the upgrade, also adds 1 to laser level
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

          if (laserLevel < 2)
          {
            laserLevel += 1;
          }
        }
      }
    }
  }
}

//Displays stats
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