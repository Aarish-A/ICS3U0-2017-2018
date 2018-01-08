class Laser
{
  //Laser properties
  PVector pos, vel, size;

  Laser()
  {
    pos = new PVector(player.pos.x, player.pos.y - player.size.y);
    vel = new PVector(0, 0);
    size = new PVector(10, 25);
  }
  
  //Draws and updates laser properties based on which level the laser is at
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
    }
  }

  //Checks to see if the laser is off the screen to delete it ("finished")
  boolean finished()
  {
    if ((pos.y + (pos.y / 2)) < 0) return true;
    else return false;
  }

  //First level for the laser, draws and updates one laser
  void levelOne()
  {
    fill(255, 0, 0);
    
    vel.y = -5;
    imageMode(CENTER);
    image(laserImage, pos.x, pos.y, size.x, size.y);
    pos.add(vel);
  }

  //Second level for the laser, draws and updates two lasers side by side
  void levelTwo()
  {
    vel.y = -5;
    imageMode(CENTER);
    image(laserImage, pos.x - 7, pos.y, size.x, size.y);
    image(laserImage, pos.x + 7, pos.y, size.x, size.y);
    pos.add(vel);
  }
}