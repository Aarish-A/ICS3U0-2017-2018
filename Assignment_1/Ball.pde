class Ball
{
  //INIT BALL PROPERTIES
  float mass;
  float weight;
  float size;
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
    size = 10;
    refArea = (2 * TWO_PI * ((size/2) * (size/2)));

    //SET BALL VECTORS
    pos = new PVector (250, 100);
    vel = new PVector (0, 0);
    accel = new PVector (0, 0);
  }

  void updateBall()
  {
    ellipse(pos.x, pos.y, size, size);
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
    dragForce.y = dragCoef * ((airDensity * (vel.y * vel.y)) / 2) * refArea;
    accel.y = ((weight - dragForce.y) / mass) / 60;
    //println("drag force =", dragForce.y);
    //println("ball acceleration =", accel.y);
  }

  void printBallVectors()
  {
    println("Ball Pos =", b1.pos.y);
    println("Ball Vel =", b1.vel.y);
    println("Ball Accel =", b1.accel.y);
    println("Ball DF =", b1.accel.y);
  }
}