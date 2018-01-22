void gameScreen()
{
  background(255);

  updateStats();
  checkGameTimer();

  c.update();
  c.checkGrounded();
  c.checkMovement();

  //Loops through all the key parts in its array list
  for (int i = keyParts.size() - 1; i >= 0; i--)
  {
    KeyPart k = keyParts.get(i);
    k.update();
    
    //Key part is deleted and added to the players key part count if collision occurs
    if (k.checkPlayerCollision())
    {  
      keyParts.remove(i);
      numOfKeys ++;
    }
  }

  //Loops through all the platforms in its array list
  for (Platform p : platforms)
  {
    p.update();
    p.checkPlayerCollision();
  }

  //for (int i = platforms.size() - 1; i >= 0; i--) 
  //{
  //  Platform p = platforms.get(i);
  //  p.update();
  //  p.checkPlayerCollision();

  //  //if (c.pos.x > p.pos.x - 20 && c.pos.x < p.pos.x + 20) p.size.y = 50;
  //  //else p.size.y = 5;

  //  //println(p.topLeftCorner, p.topRightCorner, ",");
  //}

  d.update();

  if (d.checkPlayerCollision())
  {
    screenNum ++;
  }
}

//Updates and draws game statistics (time passed, number of keys collected)
void updateStats()
{
  gameTimer = (frameCount - startTime) / 60;

  textAlign(RIGHT);
  textSize(20);
  fill(0);
  text(round(gameTimer) + " seconds", width - 20, 30);
  text(numOfKeys + " / 4 key parts", width - 20, 60);
}

//Constantly checks for if the game timer has reached more than  
//60 seconds in which the game ends
void checkGameTimer()
{
  if (gameTimer >= 30) screenNum ++;
}