void startScreen()
{
  background(255);

  //Draws slider rails
  fill(127);
  rectMode(CORNER);
  rect(50, 75, 500, 10);
  rect(50, 175, 500, 10);
  rect(50, 275, 500, 10);

  //Displays start screen text info
  fill(0);
  textSize(30);
  textAlign(LEFT);
  text("Diameter: " + inputD, 50, 60);
  text("Mass: " + inputM, 50, 160);
  text("Starting Height: " + inputY, 50, 260);
  textAlign(CENTER);
  text("Press ENTER to continue onto the next" + "\n" + "screen after choosing your values", width/2, height*0.75);

  //Draws slider handles
  rectMode(CENTER);
  rect(sliderDX, 80, 30, 20);
  rect(sliderMX, 180, 30, 20);
  rect(sliderYX, 280, 30, 20);
  
  //Updates slider position based on mouse x value after the respective slider handle has been clicked
  if (sliderDP) { sliderDX = constrain(mouseX, 50, 550); }
  if (sliderMP) { sliderMX = constrain(mouseX, 50, 550); }
  if (sliderYP) { sliderYX = constrain(mouseX, 50, 550); }

  //Maps slider position to input variable
  inputD = int(map(sliderDX, 50, 550, 1, 50));
  inputM = int(map(sliderMX, 50, 550, 1, 100));
  inputY = int(map(sliderYX, 50, 550, 1, 600));
}

void mousePressed()
{
  //Sets the boolean that allows the slider to move to true when a respective slider handle is clicked
  if (((mouseX < sliderDX + 15) && (mouseX > sliderDX - 15)) && ((mouseY < 80 + 10) && (mouseY > 80 - 10)))
  {
    sliderDP = true;
  }
  if (((mouseX < sliderMX + 15) && (mouseX > sliderMX - 15)) && ((mouseY < 180 + 10) && (mouseY > 180 - 10)))
  {
    sliderMP = true;
  }
  if (((mouseX < sliderYX + 15) && (mouseX > sliderYX - 15)) && ((mouseY < 280 + 10) && (mouseY > 280 - 10)))
  {
    sliderYP = true;
  }
}

void mouseReleased()
{
  //Sets the boolean that allws the slider to move to false when the mouse is released
  sliderDP = false;
  sliderMP = false;
  sliderYP = false;
}

void keyTyped()
{
  //Jumps to next screen and creates ball object based on input variables when enter is pressed
  if (key == ENTER)
  {
    b1 = new Ball(inputD, inputM, width/2, height - inputY);
    startScreenTime = millis();
    screenNum += 1;
  }
}


/* Old code that set ball properties and height based on raw input from user */

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