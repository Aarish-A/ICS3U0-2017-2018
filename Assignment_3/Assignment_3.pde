import processing.pdf.*;
int cardNum;

StringList bValues;
StringList iValues;
StringList nValues;
StringList gValues;
StringList oValues;

String mode;
boolean free;

void settings () 
{
  size(600, 600, PDF, "default");
}

void setup() 
{
  background(255);
  fill(0);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = "BINARY";
  free = false;
  cardNum = 10;
}

void draw()
{
  
  PGraphicsPDF pdf = (PGraphicsPDF) g;

  if (frameCount == cardNum + 1)
  {
    exit();
  } else 
  {
    textSize(50);
    text(mode + " BINGO", width/2, 75);  

    getBingo(mode);

    if (free)
    {
      fill(255);
      noStroke();
      rect(width/2, 350, 75, 75);

      fill(0);
      textSize(13);
      text("FREE!", width/2, 350);
    }

    pdf.nextPage();
  }
}