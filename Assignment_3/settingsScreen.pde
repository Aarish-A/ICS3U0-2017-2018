void settingsScreen()
{
  menuText("Choose your number system:", 40, height * 1/20);
  updateOptionsButtons("Binary", 80, height * 1/7);
  updateOptionsButtons("Octal", 195, height * 1/7);
  updateOptionsButtons("Decimal", 320, height * 1/7);
  updateOptionsButtons("Hexadecimal", 485, height * 1/7);
}

void menuText(String text, float x, float y)
{
  textAlign(LEFT, CENTER);
  fill(0);
  text(text, x, y);
}

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