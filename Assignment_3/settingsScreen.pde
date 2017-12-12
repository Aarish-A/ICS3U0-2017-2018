void settingsScreen()
{
  updateOptionsButtons("Binary", width - 15, 50);
  updateOptionsButtons("Octal", width - 15, 100);
  updateOptionsButtons("Decimal", width - 15, 150);
  updateOptionsButtons("Hexadecimal", width - 15, 200);
}

void updateOptionsButtons (String button, float x, float y)
{
  textSize(20);
  textAlign(RIGHT);

  fill(0);
  text(button, x, y);
}




//if (dist(mouseX, mouseY, width/2, h) < button.length() * 7 && mousePressed == true)
//{
//  if (button == "SHIP TYPE") screenNum = 0;
//  else if (button == "LASER COLOUR") screenNum = 0;
//  else if (button == "BACK") screenNum = 0;
//} else if (dist(mouseX, mouseY, width/2, h) < button.length() * 7)
//{
//  fill(#02EA0B);
//} else 
//{
//  fill(255);
//}