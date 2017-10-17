class Ball
{
  //INIT BALL PROPERTIES
  float mass;
  float weight;
  float diameter;
  float refArea;

  //INIT BALL VECTORS
  PVector pos;
  PVector vel;
  PVector accel;

  Ball()
  {
    //SET BALL PROPERTIES 
    mass = 15; //Arbritrary value
    weight = mass * gravityAccel;
    diameter = 10;
    refArea = (2 * TWO_PI * (pow(diameter / 2, 2)));

    //SET BALL VECTORS
    pos = new PVector (250, 100);
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
  }

  void updateBall()
  {
    ellipse(pos.x, pos.y, diameter, diameter);
  }

  void updatePos()
  {
    if ((pos.y) >= height)
    {
      vel.y *= -1;
      pos.y = height;
      //println(ballVel.y);
    }

    pos.y += vel.y; 

    if (!(pos.y + vel.y > height))
    {
      vel.y -= accel.y; //Acceleration is subtracted from position so that the velocity decreases with a negative acceleration
    }
  }

  void updateAccel()
  {
    dragForce.y = (dragCoef * ((airDensity * (pow(vel.y, 2))) / 2) * refArea) / 60;
    accel.y = (weight - dragForce.y) / mass;
  }

  void printBallVectors()
  {
    println("Ball Pos =", pos.y);
    println("Ball Vel =", vel.y);
    println("Ball Accel =", accel.y);
    println("Ball DF =", dragForce.y);
  }
}