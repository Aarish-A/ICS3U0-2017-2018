float position = 0;
float velocity = 0;
float acceleration = 0;
float gravity = -9.8;
float dC = 0.5;
float density = 1.225;
float area = 314.159;
float mass = 15;
float weight = -147.105;
float dragForce = 0;
float tVel = -(sqrt((2 * mass * -(gravity)) / (density * area * dC)));

void settings()
{
  size(600, 600);
}

void setup()
{
  frameRate(1);
}

void draw()
{
  dragForce = dC * ((density * pow(velocity, 2) / 2) * area);
  if ((dragForce + weight) >= 0)
  { 
    acceleration = 0;
    if (velocity <= tVel)
    {
      velocity = tVel;
    }
  } 
  else 
  { 
    acceleration = (weight - dragForce) / 15;
  }
  velocity += acceleration;
  position += velocity;

  println("Drag Force is", dragForce);
  println("acceleration is", acceleration);
  println("velocity is", velocity);
  println("terminal velocity is", tVel);
  println("position is", position);
  println("time is", millis()/1000);
  println(" ");
}