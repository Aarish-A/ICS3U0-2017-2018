void optionsScreen()
{
  background(0);

  createOptionsTitle();
  updateOptionsButtons("BACK", height * 9/10);
}


void createOptionsTitle()
{
  textAlign(CENTER);
  textFont(titleFont);
  textSize(100);
  fill(#02EA0B);
  text("OPTIONS", width/2, height * 2.5/10);
}

void updateOptionsButtons (String button, float _h)
{
  float h = _h;
  textFont(bodyFont);
  textSize(30);

  if (dist(mouseX, mouseY, width/2, h) < button.length() * 7 && mousePressed == true)
  {
    if (button == "SHIP TYPE") screenNum = 0;
    else if (button == "LASER COLOUR") screenNum = 0;
    else if (button == "BACK") screenNum = 0;
  } else if (dist(mouseX, mouseY, width/2, h) < button.length() * 7)
  {
    fill(#02EA0B);
  } else 
  {
    fill(255);
  }

  text(button, width/2, h);
}