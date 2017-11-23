float angle;
float hyp;
float opp;
float adj;
float dT;

PVector targetPos;
PVector laserPos;
PVector laserVel;

void setup()
{
  frameRate(60);
  size(600, 600);
  rectMode(CENTER);

  angle = 0;
  dT = 4.0*60.0;

  targetPos = new PVector(width, -height);
  laserPos = new PVector(0, 0);
  laserVel = new PVector(0, 0);
}

void draw()
{
  background(255);
  translate(0, height);

  fill(0);
  strokeWeight(10);
  point(targetPos.x, targetPos.y);
  point(0, 0);

  strokeWeight(1);
  line(targetPos.x, targetPos.y, 0, 0);

  angle = atan2(0 - (laserPos.y + height), 600 - laserPos.x);
  //angle = atan2(targetPos.y - (laserPos.y + height) , targetPos.x - laserPos.x);
  println(mouseX, mouseY);
  PVector d = PVector.sub(targetPos, laserPos);
  hyp = d.mag();
  opp = hyp * sin(angle);
  adj = hyp * cos(angle);
  laserVel.x = adj / dT;
  laserVel.y = opp / dT;

  println("Hyp is", hyp);
  println("Opp is", opp);
  println("Adj is", adj);
  println("velX is", laserVel.x);
  println("velY is", laserVel.y);
  println("Pos is", laserPos.x, laserPos.y);



  //if (mousePressed) angle = atan2(mouseY - laserPos.y , mouseX - laserPos.x);

  pushMatrix();
  rotate(angle);
  println("Angle is", degrees(angle));

  fill(255, 0, 0);
  rect(laserPos.x, laserPos.y, 10, 30);
  //laserPos.y += laserVel.y;
  //laserPos.x += laserVel.x;

  popMatrix();

  laserPos.add(laserVel);
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