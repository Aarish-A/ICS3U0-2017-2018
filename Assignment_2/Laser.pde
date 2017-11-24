class Laser
{
  PVector pos, vel, size;
  boolean fresh = true;

  float dT;
  PVector lPos1;
  PVector lPos2;
  PVector tPos1;
  PVector tPos2;

  float angle1;
  float hyp1;
  float opp1;
  float adj1;
  PVector vel1;

  float angle2;
  float hyp2;
  float opp2;
  float adj2;
  PVector vel2;

  Laser()
  {
    pos = new PVector(player.pos.x, player.pos.y - player.size.y);
    vel = new PVector(0, 0);
    size = new PVector(10, 25);
  }

  void update()
  {
    switch (laserLevel)
    {
    case 1:
      levelOne();
      break;
    case 2:
      levelTwo();
      break;
    case 3:
      levelThree();
      break;
    }
  }

  boolean finished()
  {
    if ((pos.y + (pos.y / 2)) < 0) return true;
    else return false;
  }

  void levelOne()
  {
    //fill(255, 0, 0);
    //rectMode(CENTER);
    //rect(pos.x, pos.y, size.x, size.y);

    vel.y = -5;
    imageMode(CENTER);
    image(laserImage, pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  void levelTwo()
  {
    //fill(255, 0, 0);
    //rectMode(CENTER);
    //rect(pos.x - 7, pos.y, size.x, size.y);
    //rect(pos.x + 7, pos.y, size.x, size.y);

    vel.y = -5;
    imageMode(CENTER);
    image(laserImage, pos.x - 7, pos.y, size.x, size.y);
    image(laserImage, pos.x + 7, pos.y, size.x, size.y);
    pos.add(vel);
  }

  void levelThree()
  {
    vel.y = -5;
    imageMode(CENTER);
    image(laserImage, pos.x - 7, pos.y, size.x, size.y);
    image(laserImage, pos.x + 7, pos.y, size.x, size.y);
    pos.add(vel);

    if (fresh)
    {
      float dT = 3 * 60;
      PVector lPos1 = new PVector(pos.x - 7, pos.y);
      PVector lPos2 = new PVector(pos.x + 7, pos.y);
      PVector tPos1 = new PVector(pos.x + 200, pos.y - 1000);
      PVector tPos2 = new PVector(pos.x - 200, pos.y - 1000);

      float angle1 = atan2(tPos1.y - lPos1.y, tPos1.x - lPos1.x);
      float hyp1 = dist(lPos1.x, lPos1.y, tPos1.x, tPos1.y);
      float opp1 = hyp1 * sin(angle1);
      float adj1 = hyp1 * cos(angle1);
      PVector vel1 = new PVector(adj1 / dT, opp1 / dT);

      float angle2 = atan2(tPos2.y - lPos2.y, tPos2.x - lPos2.x);
      float hyp2 = dist(lPos2.x, lPos2.y, tPos2.x, tPos2.y);
      float opp2 = hyp2 * sin(angle2);
      float adj2 = hyp2 * cos(angle2);
      PVector vel2 = new PVector(adj2 / dT, opp2 / dT);
    }

    pushMatrix();
    translate(lPos1.x, lPos1.y); 
    rotate(angle1);
    println(degrees(angle1));

    image(laserImage, 0, 0, size.y, size.x);

    lPos1.add(vel1);
    popMatrix();

    pushMatrix();
    translate(lPos2.x, lPos2.y); 
    rotate(angle2);
    println(degrees(angle2));

    image(laserImage, 0, 0, size.y, size.x);

    lPos2.add(vel2);
    popMatrix();
  }
}