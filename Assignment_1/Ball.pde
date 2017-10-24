class Ball
{
  //INIT BALL PROPERTIES
  float mass;
  float weight;
  float diameter;
  float radius;
  float refArea;


  //INIT BALL VECTORS
  PVector pos;
  PVector vel;
  PVector accel;

  float tVel;
  boolean reachedTerminal;

  Ball()
  {
    //SET BALL PROPERTIES 
    mass = 15; //Arbritrary value
    weight = mass * gravityAccel;
    diameter = 10;
    radius = diameter / 2;
    refArea = (2 * TWO_PI * (pow(radius, 2)));

    //SET BALL VECTORS
    pos = new PVector (250, 0);
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);

    tVel = -(sqrt((2 * mass * -(gravityAccel)) / (airDensity * refArea * dragCoef)));
    boolean reachedTerminal = false;
  }

  void updateBall()
  {
    ellipse(pos.x, pos.y, diameter, diameter);
  }

  //void updatePos()
  //{
  //  if ((pos.y) >= height)
  //  {
  //    vel.y *= -1;
  //    pos.y = height - (radius);
  //  }

  //  pos.y += vel.y; 

  //  if (!(pos.y + vel.y > height))
  //  {
  //    vel.y -= accel.y; //Acceleration is subtracted from position so that the velocity decreases with a negative acceleration
  //  }
  //}

  void updateAccel()
  {
    dragForce.y = dragCoef * ((airDensity * pow(vel.y, 2) / 2) * refArea);
    
    if ((dragForce.y + weight) > 0)
    {
      reachedTerminal = true;
    }
    
    if (reachedTerminal == true)
    {
      vel.y = (tVel) / 60;
      accel.y = 0;
    }
    
    if (reachedTerminal == false)
    {
      accel.y = ((weight - dragForce.y) / 15) / 60;
    }
    
    vel.y += accel.y;
    pos.y += -(vel.y);
  }

  void printBallVectors()
  {
    println("Ball Pos =", pos.y);
    println("Ball Vel =", vel.y);
    println("Ball Accel =", accel.y);
    println("Ball DF =", dragForce.y);
  }
}