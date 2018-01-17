void endScreen()
{  
  background(255);

  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width / 2, height / 2);
  
  textSize(25);
  text("Your Time: " + round(gameTimer) + " seconds!", width / 2, height / 2 + 200);
}