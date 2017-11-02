//Ball class

class Ball
{
  //BALL PHYSICAL PROPERTIES
  float diameter;
  float radius;
  float mass;
  float weight;
  float refArea;

  //BALL VECTORS
  PVector pos;
  PVector vel;
  PVector accel;
  PVector tVel;

  //BALL CONSTRUCTOR
  Ball (float _d, float _m, float _x, float _y)
  {
    diameter = _d; //Meters
    radius = diameter / 2; //Meters
    mass = _m; //Kilograms
    weight = mass * gAccel; //Kilograms * meters per frame squared
    refArea = 2 * TWO_PI * (radius * radius); //Meters squared

    pos = new PVector (_x, _y); //Meters
    vel = new PVector (0, 0); //Meters per second
    accel = new PVector (0, 0); //Meters per second squared
    tVel = new PVector (0, -(sqrt((2 * mass * -(gAccel)) / (airDensity * refArea * dragC)))); //Meters per second
  }

  void drawBall()
  {
    ellipse(pos.x, pos.y, diameter, diameter);
  }

  void updateDragForce()
  {
    dragF.y = (dragC * ((airDensity * vel.y * vel.y) / 2) * refArea) / 3600; //Converts from seconds squared to frames squared
  }

  void updateAccel()
  {
    accel.y = (weight - dragF.y) / mass;
  }

  void updateVel()
  {
    vel.y += accel.y;
    if ((pos.y) > (height - radius))
    {
      pos.y = height - radius;
      vel.y *= -0.55;
      if (vel.y < 0.01)
      {
        ballBouncing = false;
        pos.y = height - radius;
      }
    }
  }
  
  void updatePos()
  {
    pos.y -= vel.y; //Ball falls down with negative velocity, bounces up with positive velocity
  }
  
  void printValues()
  {
    println("Drag Force is", dragF.y);
    println("Acceleration is", accel.y);
    println("Velocity is", vel.y);
    println("Ball Y is", pos.y);
  }
}