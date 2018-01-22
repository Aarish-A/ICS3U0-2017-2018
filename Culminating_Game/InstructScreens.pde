//First instructions screen
void instructOne()
{
  background(255);
  textAlign(CENTER, CENTER);

  image(instructions_screen_1, 0, 0, width, height);
  instructionArrows();
}

//Second instructions screen
void instructTwo()
{
  background(255);
  textAlign(CENTER, CENTER);

  image(instructions_screen_2, 0, 0, width, height);
  instructionArrows();
}

//Third instructions screen
void instructThree()
{
  background(255);
  textAlign(CENTER, CENTER);

  image(instructions_screen_3, 0, 0, width, height);
  instructionArrows();
}

//Fourth instructions screen
void instructFour()
{
  background(255);
  textAlign(CENTER, CENTER);

  image(instructions_screen_4, 0, 0, width, height);
  instructionArrows();
}

//This function updates and draws arrows to navigate between instruction pages 
//based on what instructions screen is currently shown
void instructionArrows()
{
  fill(0);

  if (screenNum < 3)
    triangle(width - 100, height - 75, width - 100, height - 25, width - 50, height - 50);

  if (screenNum > 0)
    triangle(100, height - 75, 100, height - 25, 50, height - 50);

  rectMode(CENTER);
  if (screenNum == 3)
  {
    fill(255);
    rect(width / 2, height - 50, 50, 50);
    textAlign(CENTER, CENTER);
    fill(0);
    text("START", width / 2, height - 50);
  }
}

//Function increments or decrements the screen count based on how far the mouse button
//is pressed from the center of the triangle and what the current instructions screen is
void mousePressed()
{
  if (dist(mouseX, mouseY, width - 75, height - 50) < 50 && screenNum < 3) screenNum ++;
  else if (dist(mouseX, mouseY, 75, height - 50) < 50 && screenNum > 0) screenNum --;
  else if (dist(mouseX, mouseY, width / 2, height - 50) < 50 && screenNum == 3) screenNum ++; startTime = frameCount;
}