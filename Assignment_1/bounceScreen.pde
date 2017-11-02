void bounceScreen()
{
  background(255);
  fill(0);
  
  displayTime();
  b1.drawBall();
  
  //Ball only moves when it is considered "bouncing"
  if (ballBouncing)
  {
    b1.updateDragForce();
    b1.updateAccel();
    b1.updateVel();
    b1.updatePos();
  } else
  {
    finalTime = (time - startScreenTime) / 1000;
    delay(3000);
    screenNum += 1;
  }
  b1.printValues();
}

void displayTime()
{
  time = millis();
  textSize(25);
  text((time - startScreenTime) / 1000, 500, 50);
}