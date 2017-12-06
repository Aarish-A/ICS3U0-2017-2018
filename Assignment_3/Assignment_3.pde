IntList bDecValues;
IntList iDecValues;
IntList nDecValues;
IntList gDecValues;
IntList oDecValues;

void settings () 
{
  size(600, 600);
}

void setup() 
{
  background(0);
  textAlign(CENTER, CENTER);

  getBingo("DECIMAL");
}


void getBingo(String _numSystem)
{
  String numSystem = _numSystem;

  if (numSystem == "DECIMAL")
  {
    getValues(bDecValues, 0, 16, width / 6);
    getValues(iDecValues, 16, 31, 2 * width / 6);
    getValues(nDecValues, 31, 46, width / 2);
    getValues(gDecValues, 46, 61, 4 * width / 6);
    getValues(oDecValues, 61, 75, 5 * width / 6);
  } else if (numSystem == "BINARY")
  {
  } else if (numSystem == "OCTAL")
  {
  } else if (numSystem == "HEXADECIMAL")
  {
  }
}


void getValues(IntList list, int _range1, int _range2, float _xPos)
{
  list = new IntList();
  int range1 = _range1;
  int range2 = _range2;
  float xPos = _xPos;


  for (int i = range1; i < range2; i++) 
  {
    list.append(i);
  }

  list.shuffle();

  for (int i= 0; i < 5; i++) 
  {
    text(list.get(i), xPos, (i*100)+150);
  }
}















////b
//bDecValues = new IntList();
//for (int i = 0; i<16; i++) 
//{
//  bDecValues.append(i);
//}
//bDecValues.shuffle();
//for (int i=0; i<5; i++) 
//{
//  text(bDecValues.get(i), width/6, (i*100)+150);
//}

////i
//iDecValues = new IntList();
//for (int i = 16; i<31; i++) 
//{
//  iDecValues.append(i);
//}
//iDecValues.shuffle();
//for (int i=0; i<5; i++) 
//{
//  text(iDecValues.get(i), 2*(width/6), (i*100)+150);
//}

////n
//nDecValues = new IntList();
//for (int i = 31; i<46; i++) 
//{
//  nDecValues.append(i);
//}
//nDecValues.shuffle();
//for (int i=0; i<5; i++) 
//{
//  text(nDecValues.get(i), width/2, (i*100)+150);
//}

////g
//gDecValues = new IntList();
//for (int i = 46; i<61; i++) 
//{
//  gDecValues.append(i);
//}
//gDecValues.shuffle();
//for (int i=0; i<5; i++) 
//{
//  text(gDecValues.get(i), 4*(width/6), (i*100)+150);
//}

////o
//oDecValues = new IntList();
//for (int i = 61; i<75; i++) 
//{
//  oDecValues.append(i);
//}
//oDecValues.shuffle();
//for (int i=0; i<5; i++) 
//{
//  text(oDecValues.get(i), 5*(width/6), (i*100)+150);
//}