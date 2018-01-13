/* Aarish Adeel & Matthew How
 * Assignment 3
 * ICS 3U0
 * 12/01/17 - 
 */

import processing.pdf.*;

//GLOBAL VARIABLES
int screenNum;

//PDF EXPORT VARIABLES
PGraphicsPDF pdf;
int pageNum;
int maxPages;
boolean recording;

//BINGO TABLE CREATION VARIABLES  
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
  //GLOBAL SETUP
  screenNum = 0;

  //PDF EXPORT SETUP
  pageNum = 0;
  maxPages = 10;
  recording = false;

  //BINGO TABLE SETUP
  mode = "DECIMAL";
  free = false;
}

void draw()
{
  //Display screen based on screenNum
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
  recording = !recording;
}

//void keyPressed()
//{
//  if (screenNum == 0) screenNum++;
//  else screenNum --;
//}