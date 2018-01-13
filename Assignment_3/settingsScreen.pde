//Temporary variables for typing input
String sMaxPages = "";
char letter = ' ';

void settingsScreen()
{
  background(255);

  //Number system options (buttons)
  menuText("Choose your number system:", 40, height * 1/20);
  updateOptionsButtons("Binary", 80, height * 1/7);
  updateOptionsButtons("Octal", 195, height * 1/7);
  updateOptionsButtons("Decimal", 320, height * 1/7);
  updateOptionsButtons("Hexadecimal", 485, height * 1/7);

  //Number of pages option (slider)
  menuText("Choose the number of pages you want to print (Type): ", 40, height * 6/20);
  text(sMaxPages, 40, height * 7/20);

  //"FREE!" spot option (button)
  menuText("Do you want a free spot in the middle", 40, height * 11/20);
  updateOptionsButtons("YES", 100, height * 13/20);
  updateOptionsButtons("NO", 200, height * 13/20);
  
  text("PRESS ENTER TO CREATE YOUR BINGO CARDS!", width/2, height * 4/5);
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

  if (mousePressed && mouseX > ( x - (button.length() * 15) / 2) &&
    mouseX < ( x + (button.length() * 15) / 2) && mouseY > (y - 25) &&
    mouseY < (y + 25))
  {
    if (button == "Binary") mode = "BINARY";
    if (button == "Decimal") mode = "DECIMAL";
    if (button == "Octal") mode = "OCTAL";
    if (button == "Hexadecimal") mode = "HEXADECIMAL";
    if (button == "YES") free = true;
    if (button == "NO") free = false;
  }
}

void keyTyped()
{
  if ((key >= '0' && key <= '9') )
  {
    letter = key;

    if (sMaxPages.length() < 2)
    {
      sMaxPages += letter;
    }
  }

  if (key == ENTER)
  {
    screenNum += 1;
    maxPages = int(sMaxPages);
    recording = true;
  }
}