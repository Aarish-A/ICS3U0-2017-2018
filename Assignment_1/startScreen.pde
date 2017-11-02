void startScreen()
{
  background(255);

  //Slider slides
  fill(127);
  rectMode(CORNER);
  rect(50, 75, 500, 10);
  rect(50, 175, 500, 10);
  rect(50, 275, 500, 10);

  //Slider text
  fill(0);
  textSize(30);
  text("Diameter: " + inputD, 50, 60);
  text("Mass: " + inputM, 50, 160);
  text("Starting Height: " + inputY, 50, 260);

  //Slider handles
  rectMode(CENTER);
  rect(slider1, 80, 30, 20);
  rect(slider2, 180, 30, 20);
  rect(slider3, 280, 30, 20);
  
  inputD = int(slider1);
  inputM = int(slider2);
  inputY = int(slider3);
}

void keyTyped()
{
  if (key == ENTER)
  {
    b1 = new Ball(inputD, inputM, width/2, height - inputY);
    startScreenTime = millis();
    screenNum += 1;
  }
}




//void startScreen()
//{
//  background(255);
//  fill(0);
//  textSize(30);
//  textAlign(CENTER);

//  text("Enter in the ball's diameter", width/2, 50);
//  text(inputDiameter, width/2, 100);

//  text("Enter in the ball's mass", width/2, 250);
//  text(inputMass, width/2, 300);

//  text("Enter in the ball's starting height", width/2, 450); 
//  text(inputY, width/2, 500);
//}

//void keyTyped()
//{
//  if ((key >= '0' && key <= '9') )
//  {
//    letter = key;
//    switch (propertyNum)
//    {
//    case 0:
//      if (inputDiameter.length() < 2)
//      {
//        inputDiameter += key;
//      }
//      break;
//    case 1:
//      if (inputMass.length() < 2)
//      {
//        inputMass += key;
//      }
//      break;
//    case 2:
//      if (inputY.length() < 3)
//      {
//        inputY += key;
//      }
//      break;
//    }
//  }

//  if (key == ENTER)
//  {
//    if (propertyNum < 2)
//    {
//      propertyNum += 1;
//    } else
//    {
//      b1 = new Ball(int(inputDiameter), int(inputMass), width/2, height - int(inputY));
//      startScreenTime = millis();
//      screenNum += 1;
//    }
//  }
//}