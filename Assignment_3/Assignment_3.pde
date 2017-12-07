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
  background(255);
  fill(0);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = "OCTAL";
  free = true;

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
}

void getBingo(String numSystem)
{
  if (numSystem == "BINARY")
  {
    getValues(bValues, 1, 10, width / 6, numSystem);
    getValues(iValues, 11, 20, 2 * width / 6, numSystem);
    getValues(nValues, 21, 30, width / 2, numSystem);
    getValues(gValues, 31, 40, 4 * width / 6, numSystem);
    getValues(oValues, 41, 50, 5 * width / 6, numSystem);
  }

  if (numSystem == "OCTAL")
  {
    getValues(bValues, 1, 30, width / 6, numSystem);
    getValues(iValues, 31, 60, 2 * width / 6, numSystem);
    getValues(nValues, 61, 90, width / 2, numSystem);
    getValues(gValues, 91, 120, 4 * width / 6, numSystem);
    getValues(oValues, 121, 150, 5 * width / 6, numSystem);
  }

  if (numSystem == "DECIMAL")
  {
    getValues(bValues, 1, 15, width / 6, numSystem);
    getValues(iValues, 16, 30, 2 * width / 6, numSystem);
    getValues(nValues, 31, 45, width / 2, numSystem);
    getValues(gValues, 46, 60, 4 * width / 6, numSystem);
    getValues(oValues, 61, 75, 5 * width / 6, numSystem);
  }

  if (numSystem == "HEXADECIMAL")
  {
    getValues(bValues, 1, 50, width / 6, numSystem);
    getValues(iValues, 51, 100, 2 * width / 6, numSystem);
    getValues(nValues, 101, 150, width / 2, numSystem);
    getValues(gValues, 151, 200, 4 * width / 6, numSystem);
    getValues(oValues, 201, 250, 5 * width / 6, numSystem);
  }
}


void getValues(StringList numbers, int range1, int range2, float xPos, String numSystem)
{
  numbers = new StringList();
  textSize(13);

  for (int i = range1; i <= range2; i++) 
  {
    String temp = "";

    if (numSystem == "BINARY") 
    { 
      temp = binary(i, 6);
    } else if (numSystem == "OCTAL") 
    { 
      temp = oct(i);
    } else if (numSystem == "DECIMAL") 
    { 
      temp = str(i);
    } else if (numSystem == "HEXADECIMAL") 
    { 
      temp = hex(i, 4);
    }

    numbers.append(temp);
  }

  numbers.shuffle();

  for (int i= 0; i < 5; i++) 
  {
    text(numbers.get(i), xPos, (i*100)+150);
  }
}

String oct(int number)
{
  int octal = 0;
  int i = 1;

  while (number != 0)
  {
    octal += number % 8 * i;
    number /= 8;
    i *= 10;
  }

  return str(octal);
}