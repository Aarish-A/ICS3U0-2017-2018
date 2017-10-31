void startScreen()
{
  background(255);
  fill(0);
  textSize(30);
  textAlign(CENTER);

  text("Enter in the ball's diameter", width/2, 50);
  text(inputDiameter, width/2, 100);

  text("Enter in the ball's mass", width/2, 250);
  text(inputMass, width/2, 300);

  text("Enter in the ball's starting height", width/2, 450); 
  text(inputY, width/2, 500);
}

void keyTyped()
{
  if ((key >= '0' && key <= '9') )
  {
    letter = key;
    switch (propertyNum)
    {
    case 0:
      if (inputDiameter.length() < 2)
      {
        inputDiameter += key;
      }
      break;
    case 1:
      if (inputMass.length() < 2)
      {
        inputMass += key;
      }
      break;
    case 2:
      if (inputY.length() < 3)
      {
        inputY += key;
      }
      break;
    }
  }

  if (key == ENTER)
  {
    if (propertyNum < 2)
    {
      propertyNum += 1;
    } else
    {
      b1 = new Ball(int(inputDiameter), int(inputMass), width/2, height - int(inputY));
      startScreenTime = millis();
      screenNum += 1;
    }
  }
}