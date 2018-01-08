//Screen for startup menu screen
void menuScreen()
{
  background(0);

  //Draws and updates menu elements
  createMainTitle();
  updateMainButtons("START", height * 5/10);
  updateMainButtons("OPTIONS", height * 6/10);
  updateMainButtons("EXIT", height * 7/10);
}

//Creates main title text
void createMainTitle()
{
  textAlign(CENTER);
  textFont(titleFont);
  textSize(100);
  fill(#02EA0B);
  text("Invaders of\nSpace", width/2, height * 2.5/10);
}

//Draws and updates menu buttons, highlights if you hover over it, takes you to appropriate screen when pressed
void updateMainButtons (String button, float _h)
{
  float h = _h;
  textFont(bodyFont);
  textSize(30);

  if (dist(mouseX, mouseY, width/2, h) < button.length() * 7 && mousePressed == true)
  {
    if (button == "START") screenNum = 1;
    else if (button == "OPTIONS") screenNum = 2;
    else if (button == "EXIT") exit();
  } else if (dist(mouseX, mouseY, width/2, h) < button.length() * 7)
  {
    fill(#02EA0B);
  } else 
  {
    fill(255);
  }

  text(button, width/2, h);
}