void gameScreen()
{
  background(255);

  updateStats();
  checkGameTimer();

  c.update();
  c.checkGrounded();
  c.checkMovement();

  for (int i = keyParts.size() - 1; i >= 0; i--)
  {
    KeyPart k = keyParts.get(i);
    k.update();
    if (k.checkPlayerCollision())
    {  
      keyParts.remove(i);
      numOfKeys ++;
    }
  }

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

  //  if (c.pos.x > p.pos.x - 20 && c.pos.x < p.pos.x + 20) p.size.y = 50;
  //  else p.size.y = 5;

  //  println(p.topLeftCorner, p.topRightCorner, ",");
  //}

  d.update();

  if (d.checkPlayerCollision())
  {
    screenNum ++;
  }
}

void updateStats()
{
  gameTimer = (frameCount - startTime) / 60;

  textAlign(RIGHT);
  fill(0);
  text(gameTimer, width - 20, 20);
  text(numOfKeys, width - 20, 40);
}

void checkGameTimer()
{
  if (gameTimer >= 60) screenNum ++;
}