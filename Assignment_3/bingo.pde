void createPDF()
{ 
  //Setup up background and text properties
  fill(0);
  background(255);
  textAlign(CENTER, CENTER);
  textSize(50);
  
  //Draw title header text based on chosen number system mode
  text(mode + " BINGO", width/2, 75);  

  //Create and draw bingo table based on selected number system mode
  getBingo(mode);

  //Create and draw free spot if user has selected to do so in settings screen
  if (free)
  {
    fill(255);
    noStroke();
    rect(width/2, 350, 75, 75);

    fill(0);
    textSize(13);
    text("FREE!", width/2, 350);
  }

  //Save each frame as a different "page" to a .jpg file if recording
  if (recording)
  {
    pageNum++;
    saveFrame(str(pageNum) + ".jpg");
  }

  //Export saved frames as a .pdf file if amount of pages exceeds the max pages 
  if (pageNum > maxPages)
  {
    recording = false;
    pdf = (PGraphicsPDF) beginRecord(PDF, "bingo-.pdf");

    for (int i = 1; i <= pageNum; i++)
    {
      PImage temp = loadImage(str(i) + ".jpg");
      image(temp, 0, 0, width, height);
      if (i < maxPages)
      {
        pdf.nextPage();
      } 
    } 
    endRecord();
  }
}

void getBingo(String numSystem)
{
  //Gets and displays bingo values based on the binary number system if it is chosen
  if (numSystem == "BINARY")
  {
    getValues(bValues, 1, 10, width / 6, numSystem);
    getValues(iValues, 11, 20, 2 * width / 6, numSystem);
    getValues(nValues, 21, 30, width / 2, numSystem);
    getValues(gValues, 31, 40, 4 * width / 6, numSystem);
    getValues(oValues, 41, 50, 5 * width / 6, numSystem);
  }

  //Gets and displays bingo values based on the octal number system if it is chosen
  if (numSystem == "OCTAL")
  {
    getValues(bValues, 1, 30, width / 6, numSystem);
    getValues(iValues, 31, 60, 2 * width / 6, numSystem);
    getValues(nValues, 61, 90, width / 2, numSystem);
    getValues(gValues, 91, 120, 4 * width / 6, numSystem);
    getValues(oValues, 121, 150, 5 * width / 6, numSystem);
  }

  //Gets and displays bingo values based on the decimal number system if it is chosen
  if (numSystem == "DECIMAL")
  {
    getValues(bValues, 1, 15, width / 6, numSystem);
    getValues(iValues, 16, 30, 2 * width / 6, numSystem);
    getValues(nValues, 31, 45, width / 2, numSystem);
    getValues(gValues, 46, 60, 4 * width / 6, numSystem);
    getValues(oValues, 61, 75, 5 * width / 6, numSystem);
  }

  //Gets and displays bingo values based on the hexadecimal number system if it is chosen
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
  textSize(13);
  
  //Temporary list to store the column's values
  numbers = new StringList();

  //Add all possible values for the column based on the number system and assigned range
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

  //Shuffle numbers so that the list is random with no duplicates
  numbers.shuffle();

  //Pull the first 5 values from the list and display them in a column
  for (int i= 0; i < 5; i++) 
  {
    fill(0);
    text(numbers.get(i), xPos, (i*100)+150);
  }
}

//Function to convert a decimal number to octal and return it as a string
String oct(int decNum)
{
  int octal = 0;
  int i = 1;

  while (decNum != 0)
  {
    octal += decNum % 8 * i;
    decNum /= 8;
    i *= 10;
  }

  return str(octal);
}