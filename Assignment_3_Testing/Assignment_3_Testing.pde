int number;
char letter;
String decimal;
String binary;
String octal;
String hex;
boolean entered;


void settings()
{
  size(600, 600);  
}

void setup()
{
  number = 0;
  letter = '0';
  decimal = "";
  binary = "";
  octal = "";
  hex = "";
  entered = false;
}

void draw()
{
  background(255);
  if (entered)
  {
    println("Decimal =", decimal);
    println("Binary =", binary(number));
    println("Hexadecimal =", hex(number));
  }
}

void keyTyped()
{
  if ((key >= '0' && key <= '9') && !entered) 
  {
    decimal += key;
    number = int(decimal);
    println(number);
  } 
  else if (key == ENTER)
  {
    entered = true;
  }
}

String oct(int _num)
{
  String oct = "";
  int decNum = _num;
  int quot = 0;
  int rem = 0;
  
  if (decNum % 8 == 0 && decNum > 0)
  {
    oct += "0";
    decNum /= 8;
  }
  else if (decNum % 8 > 0)
  {
    rem = decNum % 8;
  }
  return oct;
}