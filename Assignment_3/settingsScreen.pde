void settingsScreen()
{
  //Number system options (buttons)
  menuText("Choose your number system:", 40, height * 1/20);
  updateOptionsButtons("Binary", 80, height * 1/7);
  updateOptionsButtons("Octal", 195, height * 1/7);
  updateOptionsButtons("Decimal", 320, height * 1/7);
  updateOptionsButtons("Hexadecimal", 485, height * 1/7);
  
  //Number of pages option (slider)
  menuText("Choose the number of pages you want to print:", 40, height * 6/20);
  
  //"FREE!" spot option (button)
  menuText("Do you want a free spot in the middle", 40, height * 11/20);
}

//Create and draw 
void menuText(String text, float x, float y)
{
  textAlign(LEFT, CENTER);
  fill(0);
  text(text, x, y);
}

//Create and draw buttons based on its name and position
void updateOptionsButtons (String button, float x, float y)
{
  fill(190);
  rectMode(CENTER);
  rect(x, y, button.length() * 15, 50);

  textSize(20);
  textAlign(CENTER, CENTER);
  fill(0);
  text(button, x, y);
}