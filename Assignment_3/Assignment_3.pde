import processing.pdf.*;
int cardNum;

int screenNum;

StringList bValues;
StringList iValues;
StringList nValues;
StringList gValues;
StringList oValues;

String mode;
boolean free;

void settings () 
{
  size(600, 600);
}

void setup() 
{
  cardNum = 10;
  screenNum = 0;
  mode = "DECIMAL";
  free = false;
}

void draw()
{
  background(255);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  switch (screenNum)
  {
    case 0:
      settingsScreen();
      break;
    case 1:
      createPDF();
  }
}

void mousePressed()
{
  if (screenNum == 0) screenNum++;
  else screenNum--;
}