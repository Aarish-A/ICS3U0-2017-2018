float angle;
float hyp;
float opp;
float adj;
float dT;

PVector targetPos;
PVector laserPos;
PVector laserVel;

void settings()
{
  size(600, 600);
}

void setup()
{
  frameRate(60);
  rectMode(CENTER);
  
  angle = 0;
  hyp = 0;
  opp = 0;
  adj = 0;
  dT = 4.0 * 60.0;
  
  targetPos = new PVector(width, 0);
  laserPos = new PVector(0, height);
  laserVel = new PVector(0, 0);
}

void draw()
{
  background(255);
  
  fill(0);
  strokeWeight(10);
  point(targetPos.x, targetPos.y);
  point(0, height);
  strokeWeight(1);
  line(0, height, targetPos.x, targetPos.y);
  
  angle = atan2(targetPos.y - laserPos.y, targetPos.x - laserPos.x);  
  
  pushMatrix();
  translate(laserPos.x, laserPos.y);
  rotate(angle + 90);
  println(degrees(angle));
  println(mouseX, mouseY);
  
  fill(255, 0, 0);
  rect(0, 0, 10, 30);
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