float angle;
PVector targetPos;
PVector laserPos;
PVector laserVel;

void setup()
{
  size(600, 600);
  rectMode(CENTER);
  
  angle = 0;
  
  targetPos = new PVector(width/2-100, -height + 100);
  laserPos = new PVector(width/2, height);
  laserVel = new PVector(10, -5);
}

void draw()
{
  background(255);
  fill(0);
  strokeWeight(10);
  angle = atan2(targetPos.y - laserPos.y , targetPos.x - laserPos.x);
  
  pushMatrix();
  translate(laserPos.x, laserPos.y);
  rotate(angle);
  
  point(targetPos.x, targetPos.y);
  point(laserPos.x, laserPos.y);
  
  fill(0);
  //rect(0, 0, 10, 30);
  //laserPos.add(laserVel);
  
  popMatrix();
}


  //angle = atan2(mouseY-y, mouseX-x);

  //pushMatrix();
  //translate(width/2, height/2);
  //rotate(angle);
  //println(angle);
  //rect(x, y, s, s);
  //ellipse(x + 100, y, 25, 25);
  //popMatrix();


  //pushMatrix();
  //translate(width/2, height/2);
  //if (mousePressed) angle = atan2(mouseY-y, mouseX-x);
  //if (mousePressed) angle = atan2(mouseY-height/2, mouseX-width/2);
  //rotate(angle);
  //println(angle);
  //fill(255);
  //rect(x, y, s, s);
  //ellipse(x + 100, y, 25, 25);
  //popMatrix();